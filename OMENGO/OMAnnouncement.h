//
//  OMAnnouncement.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseModel.h"

@interface OMAnnouncement : BaseModel
@property (nonatomic, assign) BOOL isRead;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *time;

+ (NSArray *)fakeData;
@end
