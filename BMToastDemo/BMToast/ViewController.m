//
//  ViewController.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "ViewController.h"
#import "BMViewToast.h"
#import "UIView+BMToast.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view bm_showLoadingToastWithMessage:@"fdsakkk"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.view bm_showSuccessToastWithMessage:@"陈宫！！！！"];
        [self.view bm_showSuccessToastWithMessage:@"fdsakll"];
    });
}


@end
