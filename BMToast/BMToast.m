//
//  BMToast.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "BMToast.h"

BMToastConfig *currentToastConfig = nil;

@implementation BMToast

+ (void)bm_showLoadingToast {
    [self bm_showLoadingToastWithMessage:nil];
}

+ (void)bm_showLoadingToastWithMessage:(NSString *)message {
    /// 如果不自动消息，loading最长显示15秒
    [self bm_showWithAutoDismiss:YES toastType:BMToastTypeLoading dismissDuration:15 message:message];
}

+ (void)bm_showSuccessToast {
    [self bm_showWithAutoDismiss:YES toastType:BMToastTypeSuccess dismissDuration:1.5 message:nil];
}

+ (void)bm_showSuccessToastWithMessage:(NSString *)message {
    [self bm_showWithAutoDismiss:YES toastType:BMToastTypeSuccess dismissDuration:1.5 message:message];
}

+ (void)bm_showSuccessToastWithMessage:(NSString *)message customImage:(UIImage *)customImage position:(BMToastPosition)position {
    [self bm_showSuccessToastWithMessage:message customImage:customImage positionPoint:[self bm_positionPointWithPosition:position]];
}

+ (void)bm_showSuccessToastWithMessage:(NSString *)message customImage:(UIImage *)customImage positionPoint:(CGPoint)positionPoint {
    [self bm_showWithAutoDismiss:YES toastType:BMToastTypeSuccess dismissDuration:1.5 message:message positionPoint:positionPoint customImage:customImage];
}


+ (void)bm_showFailureToast {
    [self bm_showWithAutoDismiss:YES toastType:BMToastTypeFailure dismissDuration:1.5 message:nil];
}

+ (void)bm_showFailureToastWithMessage:(NSString *)message {
    [self bm_showWithAutoDismiss:YES toastType:BMToastTypeFailure dismissDuration:1.5 message:message];
}

+ (void)bm_showFailureToastWithMessage:(NSString *)message customImage:(UIImage *)customImage position:(BMToastPosition)position {
    [self bm_showFailureToastWithMessage:message customImage:customImage positionPoint:[self bm_positionPointWithPosition:position]];
}

+ (void)bm_showFailureToastWithMessage:(NSString *)message customImage:(UIImage *)customImage positionPoint:(CGPoint)positionPoint {
    [self bm_showWithAutoDismiss:YES toastType:BMToastTypeFailure dismissDuration:1.5 message:message positionPoint:positionPoint customImage:customImage];
}



+ (CGPoint)bm_positionPointWithPosition:(BMToastPosition)position {
    UIView *toView = [self bm_toView];
    switch (position) {
        case BMToastPositionTop:
        {
            return CGPointMake(toView.width / 2, toView.top + 160);
        }
            break;
        case BMToastPositionBottom:
            return CGPointMake(toView.width / 2, toView.height - 160);
            break;
        default:
            break;
    }
    return CGPointZero;
}


+ (void)bm_showWithAutoDismiss:(BOOL)autoDismiss toastType:(BMToastType)toastType dismissDuration:(NSTimeInterval)dismissDuration message:(NSString *)message {
    [self bm_showWithAutoDismiss:autoDismiss toastType:toastType dismissDuration:dismissDuration message:message positionPoint:CGPointZero customImage:nil];
}

+ (void)bm_showWithAutoDismiss:(BOOL)autoDismiss toastType:(BMToastType)toastType dismissDuration:(NSTimeInterval)dismissDuration message:(NSString *)message positionPoint:(CGPoint)positionPoint customImage:(UIImage *)customImage {
    [self bm_showWithAutoDismiss:autoDismiss toView:[self bm_toView] toastType:toastType dismissDuration:dismissDuration message:message positionPoint:positionPoint customImage:customImage];
}

+ (void)bm_showWithAutoDismiss:(BOOL)autoDismiss toView:(UIView *)toView toastType:(BMToastType)toastType dismissDuration:(NSTimeInterval)dismissDuration message:(NSString *)message positionPoint:(CGPoint)positionPoint customImage:(UIImage *)customImage {
    [self bm_hideToast];
    BMToastConfig *toastConfig = [BMToastConfig new];
    toastConfig.toastType = toastType;
    toastConfig.toView = toView;
    if (CGPointEqualToPoint(CGPointZero, positionPoint)) {
        toastConfig.position = CGPointMake(toView.frame.size.width / 2, toView.frame.size.height / 2);
    } else {
        toastConfig.position = positionPoint;
    }
    /// 默认N秒自动消息
    toastConfig.dismissDuration = dismissDuration;
    BMToastView *toastView = [[BMToastView alloc] initWithToastType:toastType];
    toastView.center = toastConfig.position;
    toastView.message = message;
    toastView.toastImage = customImage;
    toastConfig.customToastView = toastView;
    toastConfig.customMaskView.frame = toView.bounds;
    [toastConfig.customMaskView addSubview:toastConfig.customToastView];
    currentToastConfig = toastConfig;
    /// 显示视图
    [currentToastConfig.toView addSubview:currentToastConfig.customMaskView];
    if (autoDismiss) {
        /// 自动消失
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(currentToastConfig.dismissDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [currentToastConfig.customMaskView removeFromSuperview];
        });
    }
}

+ (void)bm_hideToast {
    if (currentToastConfig == nil) {
        return;
    }
    [currentToastConfig.customMaskView removeFromSuperview];
    currentToastConfig = nil;
}

+ (UIView *)bm_toView {
    return nil;
}


@end
