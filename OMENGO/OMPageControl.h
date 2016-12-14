//
//  OMPageControl.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/9.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseView.h"

@interface OMPageControl : BaseView

+ (instancetype)pageControlWithIndicatorImage:(UIImage *)indicatorImage
                        CurrentIndicatorImage:(UIImage *)currentIndicatorImage;

@property (nonatomic, assign) NSUInteger numOfPage;
@property (nonatomic, assign) NSUInteger currentPage;

@end
