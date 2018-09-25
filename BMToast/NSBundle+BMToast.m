//
//  NSBundle+BMToast.m
//  BMToast
//
//  Created by Kiven on 2018/9/25.
//

#import "NSBundle+BMToast.h"

@implementation NSBundle (BMToast)

+ (instancetype)bm_toastBundle {
    static NSBundle *toastBundle = nil;
    if (nil == toastBundle) {
        toastBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:NSClassFromString(@"BMToast")] pathForResource:@"BMToast" ofType:@"bundle"]];
    }
    return toastBundle;
}


@end


