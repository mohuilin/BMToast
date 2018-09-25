//
//  BMWindowToast.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "BMWindowToast.h"

@implementation BMWindowToast

+ (UIView *)bm_toView {
    return [UIApplication sharedApplication].keyWindow;
}

@end
