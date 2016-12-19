//
//  OMTrackdownMonthStatus.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/16.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseModel.h"

/**
 *  每个月的缴费状态
 */
@interface OMTrackdownMonthStatus : BaseModel

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *propertyPrice;
@property (nonatomic, copy) NSString *waterPrice;
@property (nonatomic, copy) NSString *eletricPrice;
@property (nonatomic, copy) NSString *pollutantPrice;
@property (nonatomic, copy) NSString *rubbishPrice;

@property (nonatomic, assign) BOOL propertyPaid;
@property (nonatomic, assign) BOOL waterPaid;
@property (nonatomic, assign) BOOL eletricPaid;
@property (nonatomic, assign) BOOL pollutantPaid;
@property (nonatomic, assign) BOOL rubbishPaid;

@property (nonatomic, assign) BOOL isAllPaid;
@property (nonatomic, copy) NSString *allPriceNeedToPay;

@end
