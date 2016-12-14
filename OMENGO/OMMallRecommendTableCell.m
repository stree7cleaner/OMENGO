//
//  OMMallRecommendTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/9.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMMallRecommendTableCell.h"
@interface OMMallRecommendTableCell ()
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightTopImageView;
@property (nonatomic, strong) UIImageView *rightBottomImageView;

@end

@implementation OMMallRecommendTableCell

- (void)configure
{
    [super configure];
    self.contentView.backgroundColor = SM_backGroundColor;
    [self.contentView addSubview:self.leftImageView];
    [self.contentView addSubview:self.rightTopImageView];
    [self.contentView addSubview:self.rightBottomImageView];


    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.top.equalTo(@0);
        make.right.equalTo(self.contentView.mas_centerX);
    }];

    [self.rightTopImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(@0);
        make.bottom.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.leftImageView.mas_right).offset(1);
    }];

    [self.rightBottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightTopImageView.mas_bottom).offset(1);
        make.left.equalTo(self.rightTopImageView);
        make.right.bottom.equalTo(@0);
    }];
}

- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"02-dianzhang"]];
    }
    return _leftImageView;
}

- (UIImageView *)rightTopImageView
{
    if (!_rightTopImageView) {
        _rightTopImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"02-fangbianmian"]];
    }
    return _rightTopImageView;
}

- (UIImageView *)rightBottomImageView
{
    if (!_rightBottomImageView) {
        _rightBottomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"02-jingxuan"]];
    }
    return _rightBottomImageView;
}

+ (CGFloat)cellHeight
{
    return (SM_SCREEN_WIDTH/2.f)*342/362;
}

@end
