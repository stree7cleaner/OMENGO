//
//  NSString+TimeStamp.m
//  Follow
//
//  Created by liangshangjia on 16/3/28.
//  Copyright © 2016年 Sami-industry. All rights reserved.
//

#import "NSString+TimeStamp.h"
#import "NSDate+Format.h"

@interface STTime : NSObject
@property (nonatomic, assign) NSInteger year;
@property (nonatomic, assign) NSInteger month;
@property (nonatomic, assign) NSInteger day;
@property (nonatomic, assign) NSInteger hour;
@property (nonatomic, assign) NSInteger minute;
@property (nonatomic, assign) NSInteger second;

/**
 *  构造器
 *  @param date NSDate系统时间类
 *  @return 实例
 */
+ (instancetype)timeWithDate:(NSDate *)date;
@end

@implementation STTime
+ (instancetype)timeWithDate:(NSDate *)date
{
    STTime *time     = [STTime new];
    time.year   = [[NSDate dateStringWithFormat:@"yyyy" withDate:date] integerValue];
    time.month  = [[NSDate dateStringWithFormat:@"MM"   withDate:date] integerValue];
    time.day    = [[NSDate dateStringWithFormat:@"dd"   withDate:date] integerValue];
    time.hour   = [[NSDate dateStringWithFormat:@"HH"   withDate:date] integerValue];
    time.minute = [[NSDate dateStringWithFormat:@"mm"   withDate:date] integerValue];
    time.second = [[NSDate dateStringWithFormat:@"ss"   withDate:date] integerValue];
    return time;
}

@end


/*
 ========== ========== ========== ========== ========== ========== ========== ==========
 */


@implementation NSString (TimeStamp)

+(NSString*)getTimeRemind:(NSTimeInterval )timeInterval
{
    return [self  getTimeRemind:timeInterval
                     withFormat:@"yyyy-MM-dd"];
}


+ (NSString *)getTimeRemind:(NSTimeInterval)timeInterval withFormat:(NSString *)format {
    //创建日期格式
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:format];

    //创建
    NSDate *last = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return [dateFormatter stringFromDate:last];
}


+(NSString*)getTimeRemindWithTimeIntervalSince1970:(NSTimeInterval)timeInterval{
    
    NSString *timeSincePast = nil;
    
    //创建
    NSDate *now = [NSDate date];
    NSDate *last = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    
    STTime *nowTime = [STTime timeWithDate:now];
    STTime *lastTime = [STTime timeWithDate:last];
    
    //比较时间
    NSTimeInterval time = [now timeIntervalSinceDate:last];
    
    NSInteger days = ((int)time)/(3600*24);
    NSInteger hours = ((int)time)/3600;
    NSInteger minutes = ((int)time)/60;
    
    BOOL isToday = NO;
    if (nowTime.year == lastTime.year) { //同年
        if (nowTime.month == lastTime.month) { //同月
            if (nowTime.day == lastTime.day) { //同日
                isToday = YES;
            }
        }
    }

    //**当YES时days+1
    BOOL isDetalDay = nowTime.hour < lastTime.hour;

    if (days) {

        NSString *formatString;

        if (isDetalDay) {

            days ++;
        }
        if (days < 7 && days >= 3) {

            formatString = @"EEEHH:mm";
        } else if (days < 3 ) { //前天与昨天

            if (days >= 2) {

                formatString = @"前天HH:mm";
            }else {

                formatString = @"昨天HH:mm";
            }
        }
        else{

            formatString = @"M-d HH:mm";
        }

        timeSincePast = [NSDate dateStringWithFormat:formatString
                                            withDate:last];

    }else if (isToday ) { //今天
        if (hours) {

            timeSincePast = [NSDate dateStringWithFormat:[NSString stringWithFormat:@"HH:mm"] withDate:last];
        }else if(minutes){

            timeSincePast = [NSString stringWithFormat:@"%d分钟前",(int)minutes];
        }else if(time >= 1){

            timeSincePast = [NSString stringWithFormat:@"%d秒前",(int)time];
        }else {
            
            timeSincePast = @"刚刚";
        }
    }else { //不是今天而且时间相差天数小于1，这里必然是昨天

        timeSincePast = [NSDate dateStringWithFormat:[NSString stringWithFormat:@"昨天HH:mm"] withDate:last];
    }
    return timeSincePast;
}




@end
