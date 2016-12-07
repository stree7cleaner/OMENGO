//
//  NSString+TimeStamp.h
//  Follow
//
//  Created by liangshangjia on 16/3/28.
//  Copyright © 2016年 Sami-industry. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (TimeStamp)

/** yyyy-HH-dd*/
+ (NSString*)getTimeRemind:(NSTimeInterval )timeInterval;


/** 
 *  按所给日期格式生成日期字符串
 *  @param timeInterval 时间擢
 *  @param format 日期格式
 */
+ (NSString*)getTimeRemind:(NSTimeInterval)timeInterval
                withFormat:(NSString *)format;


/**
 *  时间流格式日期字符串生成构造器(ex:前天13:20,5分钟前...)
 *  @param timeInterval 时间擢
 */
+ (NSString*)getTimeRemindWithTimeIntervalSince1970:(NSTimeInterval)timeInterval;

@end
