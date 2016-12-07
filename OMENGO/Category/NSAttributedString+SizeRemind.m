//
//  NSAttributedString+Size.m
//  XZLife
//
//  Created by yongh on 15/9/3.
//  Copyright (c) 2015年 Sami-industry. All rights reserved.
//

#import "NSAttributedString+SizeRemind.h"

@implementation NSAttributedString (SizeRemind)

- (CGSize)boundSize:(CGSize)size {

    CGSize attrStrSize = CGSizeZero;
    
    if (self.string.length) {
        
        NSDictionary *attrDict = [self attributesAtIndex:0
                                           effectiveRange:nil];
        
        CGRect contentRect = [self.string boundingRectWithSize:size
                                                  options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingTruncatesLastVisibleLine)
                                               attributes:attrDict
                                                  context:nil];
        attrStrSize = contentRect.size;
    }

    return attrStrSize;
}

@end
