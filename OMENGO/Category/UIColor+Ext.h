//
//  UIColor+Ext.h
//  ST_Demos
//
//  Created by 梁尚嘉 on 16/4/10.
//  Copyright © 2016年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBCOLOR(r,g,b)     RGBACOLOR(r,g,b,1)
#define RGBACOLOR(r,g,b,a)  [UIColor colorwith256FxWithRed:r green:g blue:b alpha:a]
#define HEXCOLOR(HEX_STR)   [UIColor colorWithHexStr:HEX_STR]

@interface UIColor (Ext)

/**
 *  颜色构造器
 *  @param r 红(0~255)
 *  @param g 绿(0~255)
 *  @param b 蓝(0~255)
 *  @param a 透明度(0.0~1)
 */
+ (instancetype)colorwith256FxWithRed:(CGFloat)r
                                green:(CGFloat)g
                                 blue:(CGFloat)b
                                alpha:(CGFloat)a;

/**
 *  16进制字符串构造颜色
 *  @param str 16进制字符串
 */
+ (UIColor *)colorWithHexStr:(NSString *)str;


@end
