//
//  NSDate+Format.h
//  XZLife
//
//  Created by 梁尚嘉 on 15/8/31.
//  Copyright (c) 2015年 Sami-industry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)

/**
 *  构造时间字符串
 *
 *  @param format 时间的格式
 *  @param date   OC时间实例
 *
 */
+ (NSString *)dateStringWithFormat:(NSString *)format
                          withDate:(NSDate *)date;



/**
 *  构造OC时间
 *
 *  @param format  时间格式
 *  @param dateStr 时间字符串
 *
 */
+ (NSDate *)dateWithFormat:(NSString *)format
            withDateString:(NSString *)dateStr;

@end
