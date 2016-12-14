//
//  OMPageControl.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/9.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMPageControl.h"


#define kIndicator_baseTag 200
@implementation OMPageControl
{
    UIImage         *_indicatorImage;
    UIImage         *_currentIndicatorImage;
    NSUInteger      _currentPage;
    NSUInteger      _numOfPage;
    NSMutableArray  *_indicatorImageViews;
    UIImageView     *_currentIndicatorImageView;
}

#define kWidth SM_SIZE(30)
#define kHeight SM_SIZE(8)
#define kDetal SM_SIZE(10)

+ (instancetype)pageControlWithIndicatorImage:(UIImage *)indicatorImage
                        CurrentIndicatorImage:(UIImage *)currentIndicatorImage
{
    OMPageControl *pageControl = [OMPageControl new];
    pageControl -> _indicatorImage = indicatorImage;
    pageControl -> _currentIndicatorImage = currentIndicatorImage;
    [pageControl configure];
    return pageControl;
}

- (void)configure
{
    _currentIndicatorImageView = [[UIImageView alloc]initWithImage:_currentIndicatorImage];
    [self addSubview:_currentIndicatorImageView];

    _indicatorImageViews = [NSMutableArray array];
}


- (void)setNumOfPage:(NSUInteger)numOfPage
{
    _numOfPage = numOfPage;
    for (UIView *view in _indicatorImageViews) {
        view.hidden = YES;
    }

    CGRect frame = self.frame;
    frame.size.width = numOfPage*kWidth+(numOfPage-1)*kDetal;
    frame.size.height = kHeight;
    self.frame = frame;

    for (NSUInteger page = 0; page < numOfPage; page ++) {
        UIImageView *indicatorImageView = [self indicatorImageViewAtPage:page];
        if (!indicatorImageView) {
            indicatorImageView = [[UIImageView alloc]initWithImage:_indicatorImage];
            [self insertSubview:indicatorImageView belowSubview:_currentIndicatorImageView];
            [_indicatorImageViews addObject:indicatorImageView];
            [indicatorImageView setFrame:CGRectMake(page*(kWidth+kDetal), 0, kWidth, kHeight)];
        }
        indicatorImageView.hidden = NO;
    }
}

- (void)setCurrentPage:(NSUInteger)currentPage
{
    _currentPage = currentPage;
    [UIView animateWithDuration:.2 animations:^{
        _currentIndicatorImageView.frame = [_indicatorImageViews[currentPage] frame];
    }];
}

- (UIImageView *)indicatorImageViewAtPage:(NSUInteger)page
{
    return [self viewWithTag:page+kIndicator_baseTag];
}
@end
