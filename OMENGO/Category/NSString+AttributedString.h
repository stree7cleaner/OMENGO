//
//  NSString+AttrString.h
//  XZLife
//
//  Created by yongh on 15/9/2.
//  Copyright (c) 2015年 Sami-industry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (AttributedString)

/**
 *  构造NSAttributedString
 *
 *  @param color     颜色
 *  @param font      字体
 *  @param lineSpace 行距
 */
- (NSMutableAttributedString *)attributedStringWithColor:(UIColor *)color
                                                    font:(UIFont *)font
                                               lineSpace:(CGFloat)lineSpace;

@end
