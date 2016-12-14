//
//  OMMallADTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/9.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMMallADTableCell.h"
@interface OMMallADTableCell ()
@property (nonatomic,strong) UIImageView *adImageView;
@property (nonatomic,strong) UIView *bottomBar;
@end

@implementation OMMallADTableCell

- (void)configure
{
    [super configure];

    [self.contentView addSubview:self.adImageView];
    [self.contentView addSubview:self.bottomBar];

    [self makeConstraints];

}

- (void)makeConstraints
{
    [self.adImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
    }];

    [self.bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(self.adImageView.mas_bottom);
        make.height.equalTo(@(SM_SIZE(15)));
    }];
}

#pragma mark - Getters
- (UIImageView *)adImageView
{
    if (!_adImageView) {
        _adImageView = [[UIImageView alloc]initWithImage:SMImage(@"mall_fake_ad", @"png")];
    }
    return _adImageView;
}

- (UIView *)bottomBar
{
    if (!_bottomBar) {
        _bottomBar = [UIView new];
        _bottomBar.backgroundColor = SM_backGroundColor;
    }
    return _bottomBar;
}


+ (CGFloat)cellHeight
{
    return (SM_SCREEN_WIDTH/2)+SM_SIZE(15);
}

@end
