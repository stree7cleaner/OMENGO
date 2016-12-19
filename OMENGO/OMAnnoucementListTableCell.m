//
//  OMAnnoucementListTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMAnnoucementListTableCell.h"
#import "OMAnnouncement.h"
@interface OMAnnoucementListTableCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIView *noticeView;
@end

@implementation OMAnnoucementListTableCell

- (void)configure
{
    [super configure];

    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.descriptionLabel];
    [self.contentView addSubview:self.noticeView];

    [self setupConstraints];
}

- (void)configureCellWithObj:(OMAnnouncement *)announce
{
    self.noticeView.hidden = announce.isRead;
    self.timeLabel.text = announce.time;
    self.titleLabel.text = announce.title;
    self.descriptionLabel.text = announce.detail;
}

- (void)setupConstraints
{
   [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.equalTo(@(SM_SIZE(30)));
       make.top.equalTo(@(SM_SIZE(30)));
   }];

    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(30)));
        make.top.equalTo(self.titleLabel.mas_bottom).offset(SM_SIZE(10));
        make.right.equalTo(@(SM_SIZE(-30)));
        make.bottom.equalTo(@(SM_SIZE(-40)));
    }];

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(SM_SIZE(-30)));
        make.centerY.equalTo(self.titleLabel.mas_centerY);
        make.left.equalTo(self.titleLabel.mas_right).offset(SM_SIZE(30));
        make.width.equalTo(@(SM_SIZE(200)));
    }];


    [self.noticeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(10)));
        make.centerY.equalTo(self.titleLabel.mas_centerY);
    }];
}

#pragma mark - Getters
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = SM_CBFont(32);
        _titleLabel.textColor = SM_darkGrayColor;
    }
    return _titleLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.textColor = SM_lightGrayColor;
        _timeLabel.font = SM_CFont(30);
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel) {
        _descriptionLabel = [UILabel new];
        _descriptionLabel.font = SM_CFont(30);
        _descriptionLabel.textColor = SM_grayColor;
        _descriptionLabel.numberOfLines = 3;
    }
    return _descriptionLabel;
}

- (UIView *)noticeView
{
    if (!_noticeView) {
        _noticeView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_red_dot"]];
    }
    return _noticeView;
}


@end
