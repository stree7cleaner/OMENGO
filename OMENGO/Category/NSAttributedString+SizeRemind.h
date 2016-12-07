//
//  NSAttributedString+Size.h
//  XZLife
//
//  Created by yongh on 15/9/3.
//  Copyright (c) 2015年 Sami-industry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSAttributedString (SizeRemind)

/**
 *  计算大小
 *  @param size 限制的大小
 *  @return 实际大小
 */
- (CGSize)boundSize:(CGSize)size;

@end
