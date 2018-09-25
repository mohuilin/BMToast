//
//  BMToastContentView.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "BMToastMaskView.h"

@implementation BMToastMaskView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = UIColor.clearColor;
    }
    return self;
}


@end
