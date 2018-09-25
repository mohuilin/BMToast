//
//  UIViewController+Toast.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "UIViewController+Toast.h"
#import <objc/runtime.h>

@implementation UIViewController (Toast)

+ (instancetype)bm_currentDisplayViewController {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [rootVC bm_lastPresentedViewController];
}

+ (instancetype)bm_currentDisplayViewControllerContainChildVc {
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [rootVC bm_lastPresentedViewControllerContainChildVc];
}

static void *bm_vcTagValueKey = &bm_vcTagValueKey;
- (NSString *)bm_vcTag {
    NSString *bm_vcTag = objc_getAssociatedObject(self, bm_vcTagValueKey);
    return bm_vcTag;
}

- (void)setbm_vcTag:(NSString *)bm_vcTag {
    objc_setAssociatedObject(self, bm_vcTagValueKey, bm_vcTag, OBJC_ASSOCIATION_COPY);
}

- (UIViewController *)bm_lastPresentedViewController {
    if ([self isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarVC = (UITabBarController *)self;
        return [tabBarVC.selectedViewController bm_lastPresentedViewController];
    } else if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navVC = (UINavigationController *)self;
        UIViewController *lastVC = navVC.viewControllers.lastObject;
        return [lastVC bm_lastPresentedViewController];
    } else {
        if (self.presentedViewController) {
            return [self.presentedViewController bm_lastPresentedViewController];
        } else {
            return self;
        }
    }
}

- (UIViewController *)bm_lastPresentedViewControllerContainChildVc {
    if ([self isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarVC = (UITabBarController *)self;
        return [tabBarVC.selectedViewController bm_lastPresentedViewControllerContainChildVc];
    } else if ([self isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navVC = (UINavigationController *)self;
        UIViewController *lastVC = navVC.viewControllers.lastObject;
        return [lastVC bm_lastPresentedViewControllerContainChildVc];
    } else {
        if (self.presentedViewController) {
            return [self.presentedViewController bm_lastPresentedViewControllerContainChildVc];
        } else {
            if (self.childViewControllers.count) {
                for (UIViewController *vc in self.childViewControllers) {
                    // 假设vc有动画移动，未结束时调用次方法可能获取到之前的vc
                    // eg : vc1 -> vc2 的时刻调用，会获取到vc1， 开始vc1是布满window
                    //
                    //    => 这个是screen window
                    //   ||
                    // ---------------
                    // |      |      |
                    // |      |      |
                    // |      |      |
                    // |      |      |
                    // | vc1  | vc2  |
                    // |      |      |
                    // |      |      |
                    // |      |      |
                    // |      |      |
                    // --------------
                    
                    
                    if ([self bm_isDisplayInScreen:vc.view]) {
                        return [vc bm_lastPresentedViewControllerContainChildVc];
                    } else {
                        continue;
                    }
                }
                return self;
            } else {
                return self;
            }
        }
    }
}

static void *bm_navTitleLblValueKey = &bm_navTitleLblValueKey;
- (UILabel *)bm_navTitleLbl {
    UILabel *navTitleLbl =  objc_getAssociatedObject(self, bm_navTitleLblValueKey);
    if (!navTitleLbl) {
        navTitleLbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
        navTitleLbl.font = [UIFont boldSystemFontOfSize:15.0];
        navTitleLbl.textAlignment = NSTextAlignmentCenter;
        navTitleLbl.backgroundColor = [UIColor clearColor];
        navTitleLbl.textColor = [UIColor whiteColor];
        self.navigationItem.titleView = navTitleLbl;
        objc_setAssociatedObject(self, bm_navTitleLblValueKey, navTitleLbl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return navTitleLbl;
}

- (UIView *)bm_statusBar {
    UIView *statusBar = nil;
    NSData *data = [NSData dataWithBytes:(unsigned char []){0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x42, 0x61, 0x72} length:9]; // statusBar
    NSString *key = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    id object = [UIApplication sharedApplication];
    if ([object respondsToSelector:NSSelectorFromString(key)]) {
        statusBar = [object valueForKey:key];
    }
    return statusBar;
}


- (BOOL)bm_isDisplayInScreen:(UIView *)view {
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:view.frame fromView:view.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !view.isHidden && view.alpha > 0.01 && view.window == keyWindow && intersects;
}



@end
