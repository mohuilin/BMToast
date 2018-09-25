//
//  BMToast.h
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMToastConfig.h"
#import "UIViewController+Toast.h"
#import "BMToastMaskView.h"
#import "UIView+Add.h"
#import "BMToastView.h"

typedef enum : NSUInteger {
    BMToastPositionTop,
    BMToastPositionCenter,
    BMToastPositionBottom,
} BMToastPosition;

extern BMToastConfig *currentToastConfig;

@interface BMToast : UIView

/** 加载提示弹框 */
+ (void)bm_showLoadingToast;
+ (void)bm_showLoadingToastWithMessage:(NSString *)message;

/** 操作成功 */
+ (void)bm_showSuccessToast;
+ (void)bm_showSuccessToastWithMessage:(NSString *)message;
+ (void)bm_showSuccessToastWithMessage:(NSString *)message customImage:(UIImage *)customImage positionPoint:(CGPoint)positionPoint;
+ (void)bm_showSuccessToastWithMessage:(NSString *)message customImage:(UIImage *)customImage position:(BMToastPosition)position;

/** 操作失败 */
+ (void)bm_showFailureToast;
+ (void)bm_showFailureToastWithMessage:(NSString *)message;
+ (void)bm_showFailureToastWithMessage:(NSString *)message customImage:(UIImage *)customImage positionPoint:(CGPoint)positionPoint;
+ (void)bm_showFailureToastWithMessage:(NSString *)message customImage:(UIImage *)customImage position:(BMToastPosition)position;


+ (void)bm_showWithAutoDismiss:(BOOL)autoDismiss toView:(UIView *)toView toastType:(BMToastType)toastType dismissDuration:(NSTimeInterval)dismissDuration message:(NSString *)message positionPoint:(CGPoint)positionPoint customImage:(UIImage *)customImage;

/** 隐藏弹窗 */
+ (void)bm_hideToast;

/** toast显示的弹窗视图 */
+ (UIView *)bm_toView;

@end
