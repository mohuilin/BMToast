//
//  UIView+BMToast.h
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMViewToast.h"

@interface UIView (BMToast)

/** 加载提示弹框 */
- (void)bm_showLoadingToast;
- (void)bm_showLoadingToastWithMessage:(NSString *)message;
- (void)bm_showLoadingToastWithMessage:(NSString *)message duration:(CGFloat)duration;

/** 操作成功 */
- (void)bm_showSuccessToast;
- (void)bm_showSuccessToastWithMessage:(NSString *)message;
- (void)bm_showSuccessToastWithMessage:(NSString *)message customImage:(UIImage *)customImage positionPoint:(CGPoint)positionPoint;

/** 操作失败 */
- (void)bm_showFailureToast;
- (void)bm_showFailureToastWithMessage:(NSString *)message;
- (void)bm_showFailureToastWithMessage:(NSString *)message customImage:(UIImage *)customImage positionPoint:(CGPoint)positionPoint;

/** 隐藏弹窗 */
- (void)bm_hideToast;

@end
