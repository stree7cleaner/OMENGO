//
//  OMTrackdownStatusSectionHeader.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/16.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownStatusSectionHeader.h"
#import "MainConfigure.h"
@interface OMTrackdownStatusSectionHeader ()
@property (nonatomic, strong) UILabel *elementLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UIImageView *indicatorImageView;
@property (nonatomic, strong) UIView *line;
@end

@implementation OMTrackdownStatusSectionHeader
{
    BOOL isAnimating;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self configure];
    }
    return self;
}

- (void)configure
{
    [self.contentView addSubview:self.elementLabel ];
    [self.contentView addSubview:self.statusLabel];
    [self.contentView addSubview:self.indicatorImageView];
    [self.contentView addSubview:self.line];

    self.contentView.backgroundColor = SM_whiteColor;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self addGestureRecognizer:tap];
    self.userInteractionEnabled = YES;

    [self.elementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(30)));
        make.centerY.equalTo(self.contentView.mas_centerY);

    }];

    [self.indicatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(SM_SIZE(-30)));
        make.centerY.equalTo(self.contentView.mas_centerY);

    }];

    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicatorImageView.mas_left).offset(SM_SIZE(-20));
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];

    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@.5f);
    }];
}

#pragma mark - Actions
- (void)tapAction:(id)sender
{
    self.isOpen = !self.isOpen;
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectHeaderViewAtSection:isOpen:)]) {
        [self.delegate didSelectHeaderViewAtSection:self.section isOpen:_isOpen];
    }

}

#pragma mark - Setters
- (void)setElement:(NSString *)element
{
    _element = element;
    self.elementLabel.text = element;
}

- (void)setIsOpen:(BOOL)isOpen
{
    if (_isOpen == isOpen) {
        return;
    }
    _isOpen = isOpen;
//    [UIView animateWithDuration:.3 animations:^{
        self.indicatorImageView.transform = _isOpen ? CGAffineTransformMakeRotation(M_PI/2) : CGAffineTransformIdentity;
    self.line.hidden = isOpen;
//    }];
}

- (void)setIsAllPaid:(BOOL)isAllPaid
{
    _isAllPaid = isAllPaid;
    self.statusLabel.attributedText = [[NSAttributedString alloc]initWithString:isAllPaid?@"已缴":@"待缴"
                                                                     attributes:@{
                                                                                  NSForegroundColorAttributeName:isAllPaid?SM_grayColor:SM_thumeColor
                                                                                  }];
}


#pragma mark - Getters

- (UIView *)line
{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = SM_lightGrayColor;
    }
    return _line;
}

- (UILabel *)elementLabel
{
    if (!_elementLabel) {
        _elementLabel = [UILabel new];
        _elementLabel.textColor = SM_blackColor;
        _elementLabel.font = SM_CBFont(30);
    }
    return _elementLabel;
}

- (UILabel *)statusLabel
{
    if (!_statusLabel) {
        _statusLabel = [UILabel new];
        _statusLabel.font = SM_CFont(28);
    }
    return _statusLabel;
}


- (UIImageView *)indicatorImageView
{
    if (!_indicatorImageView) {
        _indicatorImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_section_indicator"]];
    }
    return _indicatorImageView;
}

+ (NSString *)identifier
{
    return NSStringFromClass(self.class);
}
@end
