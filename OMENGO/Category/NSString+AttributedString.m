//
//  NSString+AttrString.m
//  XZLife
//
//  Created by yongh on 15/9/2.
//  Copyright (c) 2015年 Sami-industry. All rights reserved.
//

#import "NSString+AttributedString.h"
@implementation NSString (AttributedString)

- (NSMutableAttributedString *)attributedStringWithColor:(UIColor *)color
                                                    font:(UIFont *)font
                                               lineSpace:(CGFloat)lineSpace
{
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle * lineStyle = [[NSMutableParagraphStyle alloc] init];
    [lineStyle setLineSpacing:lineSpace];
    NSDictionary * attrDict = @{
                                NSFontAttributeName : font,
                                NSForegroundColorAttributeName : color,
                                NSParagraphStyleAttributeName : lineStyle
                                
                                };
    [attrStr addAttributes:attrDict range:NSMakeRange(0, self.length)];
    return attrStr;
}
@end
