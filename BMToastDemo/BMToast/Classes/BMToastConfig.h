//
//  BMToastConfig.h
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define BMTColor(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

typedef enum : NSUInteger {
    BMToastTypeLoading,
    BMToastTypeSuccess,
    BMToastTypeFailure,
    BMToastCustomView
} BMToastType;

NS_ASSUME_NONNULL_BEGIN

@interface BMToastConfig : NSObject

/** 弹窗类型 */
@property (assign ,nonatomic) BMToastType toastType;
/// 位置
@property (assign ,nonatomic) CGPoint position;
/// 自定义视图
@property (nonatomic ,strong) UIView *customToastView;
/// 自定义背景视图
@property (nonatomic ,strong) UIView *customMaskView;

/// toast显示的视图
@property (nonatomic ,strong) UIView *toView;

/// 默认显示的时间
@property (assign ,nonatomic) NSTimeInterval dismissDuration;

@end

NS_ASSUME_NONNULL_END
