//
//  NSDate+Format.m
//  XZLife
//
//  Created by 梁尚嘉 on 15/8/31.
//  Copyright (c) 2015年 Sami-industry. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)
+ (NSString *)dateStringWithFormat:(NSString *)format withDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateWithFormat:(NSString *)format withDateString:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateStr];
}
@end
