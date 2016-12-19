//
//  OMTrackdownHistory.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseModel.h"

@interface OMTrackdownHistory : BaseModel

@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *property;
@property (nonatomic, copy) NSString *months;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *trackBy; //缴费者


@end
