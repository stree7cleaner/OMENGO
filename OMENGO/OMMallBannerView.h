//
//  OMMallBannerView.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/9.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseView.h"
#import "OMAddressView.h"
@interface OMMallBannerView : BaseView

@property (nonatomic, strong, readonly) OMAddressView *addressView;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)configureWithObject:(id)obj
                    IsLocal:(BOOL)isLocal;

@end
