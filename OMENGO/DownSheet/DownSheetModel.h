//
//  DownSheetModel.h
//  DownSheet
//
//  Created by wolf on 14-11-30.
//  Copyright (c) 2014年 wolf. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DownSheetModel(icon,icon_on,title) [DownSheetModel downSheetModelWithIcon:icon andIcon_on:icon_on andTitle:title]


@interface DownSheetModel : NSObject
@property(nonatomic,strong) NSString *icon;
@property(nonatomic,strong) NSString *icon_on;
@property(nonatomic,strong) NSString *title;

- (instancetype)initWithIcon:(NSString *)icon andIcon_on:(NSString *)icon_on andTitle:(NSString *)title;
+ (instancetype)downSheetModelWithIcon:(NSString*)icon andIcon_on:(NSString*)icon_on andTitle:(NSString *)title;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
