//
//  KTTableView.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/25.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc
{
    NSLog(@"%@__dealloc",NSStringFromClass(self.class));
}

@end
