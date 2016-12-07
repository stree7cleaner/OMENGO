//
//  DownSheetModel.m
//  DownSheet
//
//  Created by wolf on 14-11-30.
//  Copyright (c) 2014年 wolf. All rights reserved.
//

#import "DownSheetModel.h"

@implementation DownSheetModel
- (instancetype)initWithIcon:(NSString *)icon andIcon_on:(NSString *)icon_on andTitle:(NSString *)title{
    if (self = [super init]) {
        self.icon = icon;
        self.icon_on = icon_on;
        self.title =title;
    }
    return self;
}

+ (instancetype)downSheetModelWithIcon:(NSString*)icon andIcon_on:(NSString*)icon_on andTitle:(NSString *)title{
    return [[DownSheetModel alloc]initWithIcon:icon andIcon_on:icon_on andTitle:title];
}
@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
