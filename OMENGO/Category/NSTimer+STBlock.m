//
//  NSTimer+STBlock.m
//  WeakTimer
//
//  Created by liangshangjia on 16/6/8.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import "NSTimer+STBlock.h"

@implementation NSTimer (STBlock)

+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)duration repeats:(BOOL)repeat withCallBack:(void(^)())block
{
    return [NSTimer scheduledTimerWithTimeInterval:duration target:self selector:@selector(repeatMethod:) userInfo:[block copy] repeats:repeat];
}


+ (void)repeatMethod:(NSTimer *)timer
{
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}

@end
