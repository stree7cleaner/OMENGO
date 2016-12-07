//
//  UIScrollView+KTHeader.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/15.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "UIScrollView+KTHeader.h"
#import <objc/runtime.h>



@implementation UIScrollView (KTHeader)
static char key;

- (void)setKt_header:(KTHeader *)kt_header
{
    objc_setAssociatedObject(self, &key,kt_header,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (KTHeader *)kt_header
{
    KTHeader *header = objc_getAssociatedObject(self, &key);
    if (!header) {
        header = [KTHeader new];
        header.scrollView = self;
        [self setKt_header:header];
    }
    return header;
}

@end
