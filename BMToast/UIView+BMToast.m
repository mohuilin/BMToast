//
//  UIView+BMToast.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "UIView+BMToast.h"

@implementation UIView (BMToast)

/** 加载提示弹框 */
- (void)bm_showLoadingToast {
    [self bm_showLoadingToastWithMessage:nil];
}
- (void)bm_showLoadingToastWithMessage:(NSString *)message {
    [BMViewToast bm_showWithAutoDismiss:YES toView:self toastType:BMToastTypeLoading dismissDuration:15 message:message positionPoint:CGPointZero customImage:nil];
}

- (void)bm_showLoadingToastWithMessage:(NSString *)message duration:(CGFloat)duration {
     [BMViewToast bm_showWithAutoDismiss:YES toView:self toastType:BMToastTypeLoading dismissDuration:duration message:message positionPoint:CGPointZero customImage:nil];
}

/** 操作成功 */
- (void)bm_showSuccessToast {
    [self bm_showSuccessToastWithMessage:nil];
}
- (void)bm_showSuccessToastWithMessage:(NSString *)message {
    [self bm_showSuccessToastWithMessage:message customImage:nil positionPoint:CGPointZero];
}

- (void)bm_showSuccessToastWithMessage:(NSString *)message customImage:(UIImage *)customImage positionPoint:(CGPoint)positionPoint {
    [BMViewToast bm_showWithAutoDismiss:YES toView:self toastType:BMToastTypeSuccess dismissDuration:1.5 message:message positionPoint:positionPoint customImage:customImage];
}

/** 操作失败 */
- (void)bm_showFailureToast {
    [self bm_showFailureToastWithMessage:nil];
}

- (void)bm_showFailureToastWithMessage:(NSString *)message {
    [self bm_showFailureToastWithMessage:message customImage:nil positionPoint:CGPointZero];
}

- (void)bm_showFailureToastWithMessage:(NSString *)message customImage:(UIImage *)customImage positionPoint:(CGPoint)positionPoint {
    [BMViewToast bm_showWithAutoDismiss:YES toView:self toastType:BMToastTypeFailure dismissDuration:1.5 message:message positionPoint:positionPoint customImage:customImage];
}

/** 隐藏弹窗 */
- (void)bm_hideToast {
    [BMViewToast bm_hideToast];
}

@end
