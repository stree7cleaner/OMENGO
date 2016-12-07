//
//  KTHeader.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/15.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseModel.h"
@class UIScrollView;
typedef NS_ENUM(NSUInteger,KTHeaderEndRefreshType) {
    KTHeaderEndRefreshSuccessType,
    KTHeaderEndRefreshErrorType
};



@interface KTHeader : NSObject
@property (nonatomic, weak) UIScrollView *scrollView;
- (void)addRefreshWithBlock:(void (^)())block;
- (void)endRefreshWithType:(KTHeaderEndRefreshType)type;
@end

