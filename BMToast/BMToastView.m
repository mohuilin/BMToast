//
//  BMToastView.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "BMToastView.h"
#import "UIView+Add.h"
#import "NSBundle+BMToast.h"

@interface BMToastView ()

@property (assign ,nonatomic) BMToastType toastType;

/// 消失
@property (nonatomic ,strong) UILabel *messageLabel;

@property (nonatomic ,strong) UIImageView *toastImageView;

@end

@implementation BMToastView

- (instancetype)initWithToastType:(BMToastType)toastType {
    if (self = [super initWithFrame:CGRectZero]) {
        self.frame = CGRectMake(0, 0, 120, 120);
        self.backgroundColor = BMTColor(17, 17, 17);
        self.toastType = toastType;
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        [self setUpUI];
    }
    
    return self;
}

- (void)setUpUI {
    
    self.messageLabel = [UILabel new];
    self.messageLabel.font = [UIFont systemFontOfSize:14];
    self.messageLabel.textColor = UIColor.whiteColor;
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
    self.messageLabel.left = 5;
    self.messageLabel.height = 35;
    self.messageLabel.numberOfLines = 2;
    self.messageLabel.width = self.width - 10;
    self.messageLabel.bottom = self.height - 10;
    [self addSubview:self.messageLabel];
    
    switch (self.toastType) {
        case BMToastTypeLoading:
            [self makeLoadingView];
            break;
        case BMToastTypeSuccess:
            [self makeSuccessView];
            break;
        case BMToastTypeFailure:
            [self makeFailureView];
            break;
        default:
            break;
    }
}

- (void)makeLoadingView {
    UIActivityIndicatorView *ind = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [ind startAnimating];
    ind.centerX = self.width / 2;
    ind.top = 30;
    [self addSubview:ind];
    self.messageLabel.text = @"加载中...";
}

- (void)makeSuccessView {
    UIImageView *toastImageView = [UIImageView new];
    toastImageView.width = 50;
    toastImageView.height = 36;
    toastImageView.top = 30;
    toastImageView.centerX = self.width / 2;
    toastImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle bm_toastBundle] pathForResource:@"toast_success@2x" ofType:@"png"]];// [NSBundle bm_toastBundle] [UIImage imageNamed:@"toast_success"];
    [self addSubview:toastImageView];
    
    self.toastImageView = toastImageView;
    self.messageLabel.text = @"操作成功";
}

- (void)makeFailureView {
    UIImageView *toastImageView = [UIImageView new];
    toastImageView.width = 42;
    toastImageView.height = 42;
    toastImageView.top = 27;
    toastImageView.centerX = self.width / 2;
    toastImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle bm_toastBundle] pathForResource:@"ic_warning_white@2x" ofType:@"png"]]; // [UIImage imageNamed:@"ic_warning_white"];
    [self addSubview:toastImageView];
    
    self.toastImageView = toastImageView;
    
    self.messageLabel.text = @"操作失败";
}

- (void)setMessage:(NSString *)message {
    _message = message;
    if (message) {
        self.messageLabel.text = message;
    }
}

- (void)setToastImage:(UIImage *)toastImage {
    _toastImage = toastImage;
    if (toastImage) {
        self.toastImageView.image = toastImage;
        self.toastImageView.size = CGSizeMake(50, 50);
        self.toastImageView.bottom = self.messageLabel.top - 10;
    }
}

@end
