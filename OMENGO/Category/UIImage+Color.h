//
//  UIImage+Color.h
//  STGraduallyChangeDemo
//
//  Created by liangshangjia on 16/4/8.
//  Copyright © 2016年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
 *  颜色->图片
 *  @param color UIColor
 *  @return 颜色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;



/**
 *  改变图片颜色
 */
- (UIImage *)imageWithColor:(UIColor *)color;

@end
