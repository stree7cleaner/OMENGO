//
//  UIColor+Ext.m
//  ST_Demos
//
//  Created by 梁尚嘉 on 16/4/10.
//  Copyright © 2016年 ST. All rights reserved.
//

#import "UIColor+Ext.h"

@implementation UIColor (Ext)

+ (instancetype)colorwith256FxWithRed:(CGFloat)r
                             green:(CGFloat)g
                              blue:(CGFloat)b
                             alpha:(CGFloat)a
{
    return [self colorWithRed:r/255.f
                        green:g/255.f
                         blue:b/255.f
                        alpha:a];
}


//默认alpha值为1
+ (UIColor *)colorWithHexStr:(NSString *)str
{
    return [self colorWithHexString:str alpha:1.0f];
}












#pragma mark - Dependence

+ (UIColor *)colorWithHexString:(NSString *)color
                          alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location  = 0;
    range.length    = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location      = 2;
    NSString *gString   = [cString substringWithRange:range];
    //b
    range.location      = 4;
    NSString *bString   = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return RGBACOLOR(r, g, b, alpha);
}


@end
