//
//  BMViewToast.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "BMViewToast.h"

@implementation BMViewToast

+ (UIView *)bm_toView {
    return [UIViewController bm_currentDisplayViewController].view;
}

@end
