//
//  OMMallBannerView.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/9.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMMallBannerView.h"
#import "OMCycleADView.h"
#import "OMPageControl.h"
@interface OMMallBannerView () <OMCycleADViewDelegate>
@property (nonatomic, strong) OMCycleADView *adView;
@property (nonatomic, strong) OMPageControl *pageControl;
@property (nonatomic, strong) OMAddressView *addressView;

@end

@implementation OMMallBannerView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self configure];
    }
    return self;
}


- (void)configure
{
    [self addSubview:self.adView];
    [self addSubview:self.pageControl];
    [self addSubview:self.addressView];

    [self.addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(SM_SIZE(50)));
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@(SM_SIZE(50)));
    }];
}

- (void)configureWithObject:(id)obj IsLocal:(BOOL)isLocal
{
    NSArray *images = obj;
    [_adView setImages:images IsLocal:YES];
    self.pageControl.numOfPage = images.count;
    CGRect frame = self.pageControl.frame;
    frame.origin.x = self.frame.size.width - frame.size.width - SM_SIZE(30);
    frame.origin.y = self.frame.size.height - frame.size.height - SM_SIZE(30);
    self.pageControl.frame = frame;
}


#pragma mark - Getters
- (OMPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [OMPageControl pageControlWithIndicatorImage:[SMPNGImage(@"ic_indicator") imageWithColor:SM_whiteColor]
                                              CurrentIndicatorImage:[SMPNGImage(@"ic_indicator_hl") imageWithColor:SM_thumeColor]];
    }
    return _pageControl;
}

- (OMCycleADView *)adView
{
    if (!_adView) {
        _adView = [[OMCycleADView alloc]initWithFrame:self.frame];
        _adView.delegate = self;

        self.pageControl.numOfPage = 2;
        self.pageControl.currentPage = 0;
    }
    return _adView;
}

- (OMAddressView *)addressView
{
    if (!_addressView) {
        _addressView = [OMAddressView new];
        _addressView.layer.cornerRadius = SM_SIZE(50)/2;
        _addressView.clipsToBounds = YES;
        _addressView.backgroundColor = RGBACOLOR(0, 0, 0, .7);
    }
    return _addressView;
}

#pragma mark - OMCycleADViewDelegate
- (void)CycleADView:(OMCycleADView *)view didSelectIndex:(NSUInteger)index
{
    NSLog(@"%@",@(index));
}

- (void)CycleADView:(OMCycleADView *)view didScrollToIndex:(NSUInteger)index
{
    self.pageControl.currentPage = index;
}
@end
