//
//  OMTrackdownInfoTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/16.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownInfoTableCell.h"
@interface OMTrackdownInfoTableCell ()
@property (nonatomic, strong) UILabel *trackdownMonthsLabel;
@property (nonatomic, strong) UILabel *trackdownMonthsEleLabel;
@property (nonatomic, strong) UILabel *trackdownPriceLabel;
@property (nonatomic, strong) UILabel *trackdownPriceEleLabel;
@end

@implementation OMTrackdownInfoTableCell

- (void)configure
{
    [super configure];


    self.trackdownMonthsLabel.text = @"3个月";
    self.trackdownMonthsEleLabel.text = @"待缴费月数";
    self.trackdownPriceLabel.text = @"3000.50元";
    self.trackdownPriceEleLabel.text = @"待缴总费用";

    [self setupConstraints];
}


- (void)setupConstraints
{


    [self.contentView addSubview:self.trackdownMonthsLabel];
    [self.contentView addSubview:self.trackdownMonthsEleLabel];
    [self.contentView addSubview:self.trackdownPriceLabel];
    [self.contentView addSubview:self.trackdownPriceEleLabel];

    [self.trackdownMonthsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(20)));
        make.top.equalTo(@(SM_SIZE(50)));
        make.right.equalTo(self.contentView.mas_centerX).offset(SM_SIZE(-20));
    }];

    [self.trackdownMonthsEleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.trackdownMonthsLabel.mas_bottom).offset(SM_SIZE(20));
        make.centerX.equalTo(self.trackdownMonthsLabel.mas_centerX);
    }];

    [self.trackdownPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_centerX).offset(SM_SIZE(20));
        make.right.equalTo(@(SM_SIZE(-20)));
        make.top.equalTo(self.trackdownMonthsLabel.mas_top);
    }];

    [self.trackdownPriceEleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.trackdownPriceLabel.mas_bottom).offset(SM_SIZE(20));
        make.centerX.equalTo(self.trackdownPriceLabel.mas_centerX);
    }];
}


#pragma mark - Getters
- (UILabel *)trackdownPriceLabel
{
    if (!_trackdownPriceLabel) {
        _trackdownPriceLabel                = [UILabel new];
        _trackdownPriceLabel.font           = SM_CFont(50);
        _trackdownPriceLabel.textColor      = HEXCOLOR(@"#FF262D");
        _trackdownPriceLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return _trackdownPriceLabel;
}

- (UILabel *)trackdownPriceEleLabel
{
    if (!_trackdownPriceEleLabel) {
        _trackdownPriceEleLabel             = [UILabel new];
        _trackdownPriceEleLabel.font        = SM_CFont(32);
        _trackdownPriceEleLabel.textColor   = SM_grayColor;
    }
    return _trackdownPriceEleLabel;
}

- (UILabel *)trackdownMonthsLabel
{
    if (!_trackdownMonthsLabel) {
        _trackdownMonthsLabel               = [UILabel new];
        _trackdownMonthsLabel.font          = SM_CFont(50);
        _trackdownMonthsLabel.textColor     = HEXCOLOR(@"#FF262D");
        _trackdownMonthsLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _trackdownMonthsLabel;
}

- (UILabel *)trackdownMonthsEleLabel
{
    if (!_trackdownMonthsEleLabel) {
        _trackdownMonthsEleLabel            = [UILabel new];
        _trackdownMonthsEleLabel.font       = SM_CFont(32);
        _trackdownMonthsEleLabel.textColor  = SM_grayColor;
    }
    return _trackdownMonthsEleLabel;
}

+ (CGFloat)cellHeight
{
    return SM_SIZE(200);
}

@end
