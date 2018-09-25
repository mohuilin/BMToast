//
//  BMToastConfig.m
//  BMToast
//
//  Created by Kiven on 2018/9/21.
//  Copyright © 2018年 bitmain. All rights reserved.
//

#import "BMToastConfig.h"
#import "BMToastMaskView.h"
#import "BMToastView.h"

@implementation BMToastConfig

- (instancetype)init {
    self = [super init];
    if (self) {
        self.customMaskView = [BMToastMaskView new];
    }
    return self;
}

@end
