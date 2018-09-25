//
//  BMToastView.h
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMToastConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface BMToastView : UIView

- (instancetype)initWithToastType:(BMToastType)toastType;
@property (copy ,nonatomic) NSString *message;
@property (nonatomic ,strong) UIImage *toastImage;

@end

NS_ASSUME_NONNULL_END
