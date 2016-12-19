//
//  OMTrackdownHistoryTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownHistoryTableCell.h"
#import "OMTrackdownHistory.h"
@interface OMTrackdownHistoryTableCell ()

@property (nonatomic, strong) UILabel *timeEleLabel;
@property (nonatomic, strong) UILabel *propertyEleLabel;
@property (nonatomic, strong) UILabel *monthsEleLabel;
@property (nonatomic, strong) UILabel *priceEleLabel;
@property (nonatomic, strong) UILabel *trackByEleLabel;

@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *propertyLabel;
@property (nonatomic, strong) UILabel *monthsLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *trackByLabel;
@end

@implementation OMTrackdownHistoryTableCell

- (void)configureCellWithObj:(OMTrackdownHistory *)history
{
    self.timeLabel.text = history.time;
    self.propertyLabel.text = history.property;
    self.monthsLabel.text = history.months;
    self.priceLabel.text=  [@"￥" stringByAppendingString:history.price];
    self.trackByLabel.text = history.trackBy;
}


- (void)configure
{
    [super configure];

    [self.contentView addSubview:self.timeEleLabel];
    [self.contentView addSubview:self.propertyEleLabel];
    [self.contentView addSubview:self.monthsEleLabel];
    [self.contentView addSubview:self.priceEleLabel];
    [self.contentView addSubview:self.trackByEleLabel];

    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.propertyLabel];
    [self.contentView addSubview:self.monthsLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.trackByLabel];

    self.timeEleLabel.text      = @"时间";
    self.propertyEleLabel.text  = @"物业";
    self.monthsEleLabel.text    = @"缴费月份";
    self.priceEleLabel.text     = @"缴费金额";
    self.trackByEleLabel.text      = @"缴费人";

    [self setupConstraints];
}

#define kLeftMargin SM_SIZE(20)
#define kTopMargin SM_SIZE(20)
#define kEleWidth SM_SIZE(200)
#define kBottomMargin SM_SIZE(30)
#define kDetal SM_SIZE(15)
#define kVerticalDistance SM_SIZE(20)

- (void)setupConstraints
{
    [self.timeEleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kLeftMargin));
        make.top.equalTo(@(kTopMargin));
        make.width.equalTo(@(kEleWidth));
    }];

    [self.propertyEleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kLeftMargin));
        make.top.equalTo(self.timeEleLabel.mas_bottom).offset(kDetal);
        make.width.equalTo(self.timeEleLabel);
    }];

    [self.monthsEleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kLeftMargin));
        make.top.equalTo(self.propertyEleLabel.mas_bottom).offset(kDetal);
        make.width.equalTo(self.timeEleLabel);
    }];

    [self.priceEleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kLeftMargin));
        make.top.equalTo(self.monthsLabel.mas_bottom).offset(kDetal);
        make.width.equalTo(self.timeEleLabel);
    }];

    [self.trackByEleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(kLeftMargin));
        make.top.equalTo(self.priceEleLabel.mas_bottom).offset(kDetal);
        make.width.equalTo(self.timeEleLabel);
    }];


    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeEleLabel.mas_right).offset(kVerticalDistance);
        make.top.equalTo(self.timeEleLabel.mas_top);
        make.right.equalTo(@(-kLeftMargin));
    }];

    [self.propertyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeEleLabel.mas_right).offset(kVerticalDistance);
        make.top.equalTo(self.propertyEleLabel.mas_top);
        make.right.equalTo(@(-kLeftMargin));
    }];

    [self.monthsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeEleLabel.mas_right).offset(kVerticalDistance);
        make.top.equalTo(self.monthsEleLabel.mas_top);
        make.right.equalTo(@(-kLeftMargin));
    }];

    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeEleLabel.mas_right).offset(kVerticalDistance);
        make.top.equalTo(self.priceEleLabel.mas_top);
        make.right.equalTo(@(-kLeftMargin));
    }];

    [self.trackByLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeEleLabel.mas_right).offset(kVerticalDistance);
        make.top.equalTo(self.trackByEleLabel.mas_top);
        make.right.equalTo(@(-kLeftMargin));
        make.bottom.equalTo(@(-kBottomMargin));
    }];


}


#pragma mark - Getters
- (UILabel *)eleLabelFactory
{
    UILabel *label = [UILabel new];
    label.font = SM_CFont(32);
    label.textColor = SM_blackColor;
    label.textAlignment = NSTextAlignmentRight;
    return label;
}

- (UILabel *)contLabelFactory
{
    UILabel *label = [UILabel new];
    label.font = SM_CFont(32);
    label.textColor = SM_grayColor;
    return label;
}

- (UILabel *)timeEleLabel
{
    if (!_timeEleLabel) {
        _timeEleLabel = [self eleLabelFactory];
    }
    return _timeEleLabel;
}

- (UILabel *)propertyEleLabel
{
    if (!_propertyEleLabel) {
        _propertyEleLabel = [self eleLabelFactory];
    }
    return _propertyEleLabel;
}


- (UILabel *)monthsEleLabel
{
    if (!_monthsEleLabel) {
        _monthsEleLabel = [self eleLabelFactory];
    }
    return _monthsEleLabel;
}

- (UILabel *)priceEleLabel
{
    if (!_priceEleLabel) {
        _priceEleLabel = [self eleLabelFactory];
    }
    return _priceEleLabel;
}

- (UILabel *)trackByEleLabel
{
    if (!_trackByEleLabel) {
        _trackByEleLabel = [self eleLabelFactory];
    }
    return _trackByEleLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [self contLabelFactory];
    }
    return _timeLabel;
}

- (UILabel *)propertyLabel
{
    if (!_propertyLabel) {
        _propertyLabel = [self contLabelFactory];
    }
    return _propertyLabel;
}


- (UILabel *)monthsLabel
{
    if (!_monthsLabel) {
        _monthsLabel = [self contLabelFactory];
        _monthsLabel.numberOfLines = 0;
    }
    return _monthsLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [self contLabelFactory];
        _priceLabel.textColor = HEXCOLOR(@"#E51B23");
    }
    return _priceLabel;
}

- (UILabel *)trackByLabel
{
    if (!_trackByLabel) {
        _trackByLabel = [self contLabelFactory];
    }
    return _trackByLabel;
}
@end
