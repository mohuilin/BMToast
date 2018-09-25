//
//  UIViewController+Toast.h
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Toast)

@property (nonatomic, copy) NSString *bm_vcTag;

@property (nonatomic, strong, readonly) UILabel *bm_navTitleLbl;

@property (nonatomic, strong, readonly) UIView *bm_statusBar;

+ (instancetype)bm_currentDisplayViewController;

+ (instancetype)bm_currentDisplayViewControllerContainChildVc;

@end

NS_ASSUME_NONNULL_END
