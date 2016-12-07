//
//  KTHeader.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/15.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "KTHeader.h"
#import "LPRefresh.h"
@implementation KTHeader
- (void)endRefreshWithType:(KTHeaderEndRefreshType)type
{
    if (type == KTHeaderEndRefreshSuccessType) {
        [self.scrollView endRefreshingSuccess];
    }else if (type == KTHeaderEndRefreshErrorType){
        [self.scrollView endRefreshingFail];
    }
}

- (void)addRefreshWithBlock:(void (^)())block
{
    [self.scrollView addRefreshWithBlock:block];
}
@end
