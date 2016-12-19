//
//  OMTrackdownHistory.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownHistory.h"

@implementation OMTrackdownHistory
+ (NSArray *)fakeData
{
    return [self mj_objectArrayWithKeyValuesArray: @[
                                                     @{
                                                         @"trackBy":@"13670675196",
                                                         @"property":@"嘉信城市花园1期22栋201",
                                                         @"months":@"2016年3月,2016年4月,2016年5月,2016年6月,2016年7月,2016年8月",
                                                         @"time":@"2016-05-16 09:30",
                                                         @"price":@"1000.00"},
                                                     @{
                                                         @"trackBy":@"13670675195",
                                                         @"property":@"嘉信城市花园1期22栋201",
                                                         @"months":@"2016年2月",
                                                         @"time":@"2016-03-16 09:30",
                                                         @"price":@"322.85"},
                                                     @{
                                                         @"trackBy":@"物业余额自动扣费",
                                                         @"property":@"嘉信城市花园1期22栋201",
                                                         @"months":@"2016年1月",
                                                         @"time":@"2016-02-15 09:30",
                                                         @"price":@"285.94"},
                                                     ]];
}
@end
