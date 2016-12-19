//
//  OMAnnouncement.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMAnnouncement.h"

@implementation OMAnnouncement
+ (NSArray *)fakeData
{
    return [self mj_objectArrayWithKeyValuesArray: @[
             @{
                 @"isRead":@(NO),
                 @"title":@"嘉信城市花园一二三五期将受到台风天气的袭击",
                 @"detail":@"接顺德天气预计，8月1日-8月3晶顺德将有一次暴雨到大暴雨降水过程，并伴8-10级大风等强对流天气。现我区已进入暴雨和强对流天气频发期。",
                 @"time":@"2016-03-15"},
             @{
                 @"isRead":@(NO),
                 @"title":@"此处显示标题前的前13个字一二三...",
                 @"detail":@"此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。此处显示内容的前80个字。",
                 @"time":@"2016-03-14"
                 },
             ]];
}
@end
