//
//  NSTimer+STBlock.h
//  WeakTimer
//
//  Created by liangshangjia on 16/6/8.
//  Copyright © 2016年 Stree7. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (STBlock)


+ (instancetype)scheduledTimerWithTimeInterval:(NSTimeInterval)duration
                                       repeats:(BOOL)repeat
                                  withCallBack:(void(^)())block;
@end
