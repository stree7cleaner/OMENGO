//
//  OMConsumerGoodTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/14.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMConsumerGoodTableCell.h"
@interface OMConsumerGoodTableCell ()
@property (nonatomic, strong) UIButton *plusBtn;
@property (nonatomic, strong) UIButton *reduceBtn;
@property (nonatomic, strong) UILabel *numberLabel;
@end
@implementation OMConsumerGoodTableCell

- (void)configure
{
    [super configure];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.stockLabel];

    [self.contentView addSubview:self.plusBtn];
    [self.contentView addSubview:self.reduceBtn];
    [self.contentView addSubview:self.numberLabel];

    [self setupConstraints];

}

- (void)setupConstraints
{
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(SM_SIZE(20)));
        make.bottom.equalTo(@(SM_SIZE(-20)));
        make.width.equalTo(self.iconImageView.mas_height);
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(SM_SIZE(20));
        make.top.equalTo(self.iconImageView.mas_top);
        make.right.equalTo(@(SM_SIZE(-20)));
    }];

    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.bottom.equalTo(@(SM_SIZE(-20)));
    }];

    [self.stockLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel.mas_left);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(SM_SIZE(10));
    }];

    [self.plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(SM_SIZE(-40)));
        make.bottom.equalTo(self.iconImageView.mas_bottom);
    }];

    [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.plusBtn.mas_left).offset(SM_SIZE(-5));
        make.width.equalTo(@(SM_SIZE(70)));
        make.centerY.equalTo(self.plusBtn.mas_centerY);
    }];

    [self.reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.numberLabel.mas_left).offset(SM_SIZE(-5));
        make.bottom.equalTo(self.iconImageView.mas_bottom);
    }];


}

#pragma mark - Setters
- (void)setNum:(NSUInteger)num
{
    _num = num;
    _numberLabel.text = [@(num) stringValue];
    if (self.num > 0) {
        self.numberLabel.hidden = NO;
        self.reduceBtn.hidden = NO;
    }else if (self.num == 0) {

        self.numberLabel.hidden = YES;
        self.reduceBtn.hidden = YES;
    }
}

#pragma mark - Getters
- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = SM_CFont(30);
        _titleLabel.numberOfLines = 2;
        _titleLabel.textColor = SM_darkGrayColor;
    }
    return _titleLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.textColor = HEXCOLOR(@"#F50F10");
        _priceLabel.font = SM_CBFont(28);
    }
    return _priceLabel;
}

- (UILabel *)stockLabel
{
    if (!_stockLabel) {
        _stockLabel = [UILabel new];
        _stockLabel.textColor = SM_lightGrayColor;
        _stockLabel.font = SM_CFont(25);

    }
    return _stockLabel;
}

- (UIButton *)plusBtn
{
    if (!_plusBtn) {
        _plusBtn = [UIButton new];
        [_plusBtn setImage:[UIImage imageNamed:@"btn_item_add"] forState:UIControlStateNormal];
        [_plusBtn addTarget:self action:@selector(numberBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _plusBtn;
}

- (UIButton *)reduceBtn
{
    if (!_reduceBtn) {
        _reduceBtn = [UIButton new];
        [_reduceBtn setImage:[UIImage imageNamed:@"btn_item_reduce"] forState:UIControlStateNormal];
        [_reduceBtn addTarget:self action:@selector(numberBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        _reduceBtn.hidden = YES;
    }
    return _reduceBtn;
}

- (UILabel *)numberLabel
{
    if (!_numberLabel) {
        _numberLabel = [UILabel new];
        _numberLabel.font = SM_CFont(30);
        _numberLabel.textColor = SM_darkGrayColor;
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        _numberLabel.text = @"0";
        _numberLabel.hidden = YES;
    }
    return _numberLabel;
}


#pragma mark - Actions
- (void)numberBtnClick:(UIButton *)button
{
    if (_plusBtn == button) { // +
        self.num ++;

    }else if (_reduceBtn == button) { // -
        if (self.num > 0) {
            self.num --;
        }else {
            return;
        }
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(didChangeNumber:atIndexPath:)]) {
        [self.delegate didChangeNumber:self.num atIndexPath:[(UITableView *)self.superview.superview indexPathForCell:self]];
    }
    if (_plusBtn == button && self.delegate && [self.delegate respondsToSelector:@selector(didClickPlusButton:)]) {
        [self.delegate didClickPlusButton:_plusBtn];
    }
}

+ (CGFloat)cellHeight
{
    return SM_SIZE(200);
}

@end
