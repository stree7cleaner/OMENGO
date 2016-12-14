//
//  OMAddressView.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/9.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMAddressView.h"
@interface OMAddressView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *addressLabel;
@end

@implementation OMAddressView

- (instancetype)init
{
    if (self = [super init]) {
        [self configure];
    }
    return self;
}


- (void)configure
{
    [self addSubview:self.addressLabel];
    [self addSubview:self.imageView];

    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(20)));
        make.centerY.equalTo(self.mas_centerY);
    }];

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.addressLabel.mas_centerY);
        make.left.equalTo(self.addressLabel.mas_right).offset(SM_SIZE(8));
        make.right.equalTo(@(SM_SIZE(-20)));
    }];
}


- (void)setAddress:(id)address
{
    self.addressLabel.text = address;
}

#pragma mark - Getters
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]initWithImage:[SMPNGImage(@"ic_arrow_down") imageWithColor:SM_whiteColor]];
    }
    return _imageView;
}

- (UILabel *)addressLabel
{
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = SM_CFont(32);
        _addressLabel.textColor = SM_whiteColor;
    }
    return _addressLabel;
}
@end
