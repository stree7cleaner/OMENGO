//
//  OMPropertyTrackByTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMPropertyTrackByTableCell.h"
@interface OMPropertyTrackByTableCell ()
@property (nonatomic, strong) UIImageView *edgeImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@end

@implementation OMPropertyTrackByTableCell

- (void)configure
{
    [super configure];
    [self.contentView addSubview:self.edgeImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.phoneLabel];
    [self.contentView addSubview:self.addressLabel];

    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.backgroundColor = SM_whiteColor;

    self.nameLabel.text = @"梁先生";
    self.phoneLabel.text = @"13333333333";
    self.addressLabel.text = @"嘉信城市花园1期 22栋325A";

    [self.edgeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.width.equalTo(@(SM_SCREEN_WIDTH));
    }];

    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@(SM_SIZE(30)));
    }];

    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel.mas_centerY);
        make.left.equalTo(self.nameLabel.mas_right).offset(SM_SIZE(10));
    }];

    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(SM_SIZE(15));
        make.right.equalTo(@(SM_SIZE(-30)));
    }];

}

#pragma mark - Getters
- (UIImageView *)edgeImageView
{
    if (!_edgeImageView) {
        _edgeImageView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"ic_envelope_edge"] resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile]];
    }
    return _edgeImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textColor = SM_darkGrayColor;
        _nameLabel.font = SM_CBFont(33);
    }
    return _nameLabel;
}

- (UILabel *)phoneLabel
{
    if (!_phoneLabel) {
        _phoneLabel = [UILabel new];
        _phoneLabel.textColor = SM_darkGrayColor;
        _phoneLabel.font = SM_CFont(34);
    }
    return _phoneLabel;
}

- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = SM_CFont(32);
        _addressLabel.textColor = SM_darkGrayColor;
    }
    return _addressLabel;
}

+ (CGFloat)cellHeight
{
    return SM_SIZE(150);
}

@end
