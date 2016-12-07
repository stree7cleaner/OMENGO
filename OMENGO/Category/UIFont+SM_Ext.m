//
//  UIFont+SM_Ext.m
//  Follows
//
//  Created by liangshangjia on 16/5/11.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//

#import "UIFont+SM_Ext.h"

@implementation UIFont (SM_Ext)

+ (UIFont *)customFontOfSize:(CGFloat)size
{
//    NSArray *familyNames = [UIFont familyNames];
//    for(NSString *familyName in familyNames)
//    {
//        NSLog(@"%@", familyName);
//        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
//        for(NSString *fontName in fontNames)
//        {
//            NSLog(@"\t%@", fontName);
//        }  
//    }
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
    return  font? font :[UIFont systemFontOfSize:size];
}

+ (UIFont *)customBoldFontOfSize:(CGFloat)size
{
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
    return font? font : [UIFont boldSystemFontOfSize:size];
}

@end
