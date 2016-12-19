//
//  KTPaySelectionTableCell.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/12/12.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "KTPaySelectionTableCell.h"

@implementation KTPaySelectionTableCell



- (void)configure
{
    [super configure];

    self.contentView.backgroundColor = SM_whiteColor;

    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.descriptionLabel];

    [self.contentView addSubview:self.selectionView];
    [self.contentView addSubview:self.separatorLine];
    [self makeConstraint];
}

- (void)makeConstraint
{

    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(20.f)));
        make.top.equalTo(@(SM_SIZE(30.f)));
        make.bottom.equalTo(@0);
        make.width.equalTo(self.iconImageView.mas_height);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(SM_SIZE(30.f));
        make.top.equalTo(self.iconImageView.mas_top).offset(SM_SIZE(20.f));
    }];
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(SM_SIZE(10));
        make.width.equalTo(self.titleLabel.mas_width);
    }];
    [self.selectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(SM_SIZE(-20)));
        make.centerY.equalTo(self.iconImageView.mas_centerY);
    }];
    [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.right.equalTo(@(-SM_SIZE(20.)));
        make.left.equalTo(self.iconImageView.mas_right).offset(SM_SIZE(20.f));
        make.height.equalTo(@(SM_SIZE(2)));
    }];
}

#pragma mark - Getters
- (UIView *)separatorLine
{
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc]init];
        _separatorLine.backgroundColor = HEXCOLOR(@"#F7F7F7");;
    }
    return _separatorLine;
}
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc]init];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = SM_darkGrayColor;
        _titleLabel.font = SM_CFont(33);
    }
    return _titleLabel;
}

- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc]init];
        _descriptionLabel.font = SM_CFont(25);
        _descriptionLabel.textColor = SM_grayColor;

    }
    return _descriptionLabel;
}

- (UIImageView *)selectionView
{
    if (!_selectionView) {
        _selectionView = [[UIImageView alloc]init];
        [_selectionView setImage:[SMPNGImage(@"icon_paySelection_sl") imageWithColor:HEXCOLOR(@"#C3C3C3")]];
    }
    return _selectionView;
}

- (void)setChosen:(BOOL)chosen
{
    _chosen = chosen;
    [_selectionView setImage:[SMPNGImage(@"icon_paySelection_sl") imageWithColor:self.isChosen?SM_thumeColor:HEXCOLOR(@"#C3C3C3")]];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{

}

+ (CGFloat)cellHeight
{
    return SM_SIZE(135.f);
}


@end
