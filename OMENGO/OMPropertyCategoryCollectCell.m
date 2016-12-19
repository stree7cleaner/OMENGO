//
//  OMPropertyCategoryCollectCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMPropertyCategoryCollectCell.h"

@implementation OMPropertyCategoryCollectCell


- (void)configure
{
    [super configure];

    [self makeConstraints];
}

- (void)makeConstraints
{


    UIView *containView =[UIView new];
    [self.contentView addSubview:containView];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.centerX.equalTo(self.contentView.mas_centerX);
    }];

    [containView addSubview:self.imageView];
    [containView addSubview:self.label];

//    containView.backgroundColor = SM_lightBlueColor;
//    self.imageView.backgroundColor = SM_grayColor;

    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(@0);
        make.width.height.equalTo(@(OMPropertyCategoryCollectCell_size*.5111));
    }];

    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.imageView.mas_bottom).offset(SM_SIZE(10));
        make.bottom.equalTo(@0);
    }];

}

- (UILabel *)label
{
    if (!_label) {
        _label = [UILabel new];
        _label.font = SM_CFont(28);
        _label.textColor = SM_grayColor;
    }
    return _label;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}


@end
