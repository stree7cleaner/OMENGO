//
//  OMTrackdownMonthStatus.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/16.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownMonthStatus.h"

@implementation OMTrackdownMonthStatus
+ (NSArray *)fakeData
{
    return [self mj_objectArrayWithKeyValuesArray:@[
                                                    @{
                                                        @"time":@"2016年12月",

                                                        @"propertyPrice":@"500.00",
                                                        @"waterPrice":@"100.00",
                                                        @"eletricPrice":@"201.49",
                                                        @"pollutantPrice":@"39.00",
                                                        @"rubbishPrice":@"60.91",

                                                        @"propertyPaid":@(NO),
                                                        @"waterPaid":@(NO),
                                                        @"eletricPaid":@(YES),
                                                        @"pollutantPaid":@(YES),
                                                        @"rubbishPaid":@(YES),
                                                        },
                                                    @{
                                                        @"time":@"2016年11月",

                                                        @"propertyPrice":@"420.00",
                                                        @"waterPrice":@"190.00",
                                                        @"eletricPrice":@"211",
                                                        @"pollutantPrice":@"46.00",
                                                        @"rubbishPrice":@"60.91",

                                                        @"propertyPaid":@(YES),
                                                        @"waterPaid":@(YES),
                                                        @"eletricPaid":@(YES),
                                                        @"pollutantPaid":@(YES),
                                                        @"rubbishPaid":@(NO),
                                                        },
                                                    @{
                                                        @"time":@"2016年10月",

                                                        @"propertyPrice":@"420.00",
                                                        @"waterPrice":@"190.00",
                                                        @"eletricPrice":@"211",
                                                        @"pollutantPrice":@"46.00",
                                                        @"rubbishPrice":@"60.91",

                                                        @"propertyPaid":@(YES),
                                                        @"waterPaid":@(YES),
                                                        @"eletricPaid":@(NO),
                                                        @"pollutantPaid":@(YES),
                                                        @"rubbishPaid":@(YES),
                                                        },
                                                    @{

                                                        @"time":@"2016年9月",

                                                        @"propertyPrice":@"420.00",
                                                        @"waterPrice":@"190.00",
                                                        @"eletricPrice":@"211",
                                                        @"pollutantPrice":@"46.00",
                                                        @"rubbishPrice":@"60.91",

                                                        @"propertyPaid":@(YES),
                                                        @"waterPaid":@(YES),
                                                        @"eletricPaid":@(YES),
                                                        @"pollutantPaid":@(YES),
                                                        @"rubbishPaid":@(YES),
                                                        },


                                                    ]];
}


- (BOOL)isAllPaid
{
    return self.propertyPaid && self.waterPaid && self.eletricPaid && self.pollutantPaid && self.rubbishPaid;
}

- (NSString *)allPriceNeedToPay
{
    if (!_allPriceNeedToPay) {
        float prize = 0;
        if (!self.propertyPaid) {
            prize += [self.propertyPrice floatValue];
        }
        if (!self.waterPaid) {
            prize += [self.waterPrice floatValue];
        }
        if (!self.pollutantPaid) {
            prize += [self.pollutantPrice floatValue];
        }
        if (!self.eletricPaid) {
            prize += [self.eletricPrice floatValue];
        }
        if (!self.rubbishPaid) {
            prize += [self.rubbishPrice floatValue];
        }
        _allPriceNeedToPay = [NSString stringWithFormat:@"%.2f",prize];
    }
    return _allPriceNeedToPay;
}
@end
