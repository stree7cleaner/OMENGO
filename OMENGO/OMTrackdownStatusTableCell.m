//
//  OMTrackdownStatusTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/16.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownStatusTableCell.h"
#import "OMTrackdownMonthStatus.h"
@interface OMTrackdownStatusTableCell ()
@property (nonatomic, strong) UILabel *subjectLabel;
@property (nonatomic, strong) UILabel *subjectDetailLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *priceDetailLabel;
@property (nonatomic, strong) UILabel *statusLabel;
@property (nonatomic, strong) UILabel *statusDetailLabel;
@end


@implementation OMTrackdownStatusTableCell
- (void)configure
{
    [super configure];
    [self.contentView addSubview:self.subjectLabel];
    [self.contentView addSubview:self.subjectDetailLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.priceDetailLabel];
    [self.contentView addSubview:self.statusLabel];
    [self.contentView addSubview:self.statusDetailLabel];

    self.subjectLabel.text = @"缴费项目";
    NSArray *subjects = @[
                          [[NSAttributedString alloc]initWithString:@"物业费"],
                          [[NSAttributedString alloc]initWithString:@"水费"],
                          [[NSAttributedString alloc]initWithString:@"电费"],
                          [[NSAttributedString alloc]initWithString:@"排污费"],
                          [[NSAttributedString alloc]initWithString:@"生活垃圾费"],
                          ];
    self.subjectDetailLabel.attributedText = [self attributedStringWithSubAttributedStrs:subjects];
    self.priceLabel.text = @"费用价格";


    self.statusLabel.text = @"缴费状态";
//    self.statusDetailLabel.backgroundColor = SM_waterBlueColor;
    [self setupConstraints];
}

- (void)configureCellWithObj:(OMTrackdownMonthStatus *)status
{

    NSArray *prices = @[
                        [[NSAttributedString alloc]initWithString:[@"￥" stringByAppendingString:status.propertyPrice]],
                        [[NSAttributedString alloc]initWithString:[@"￥" stringByAppendingString:status.waterPrice]],
                        [[NSAttributedString alloc]initWithString:[@"￥" stringByAppendingString:status.eletricPrice]],
                        [[NSAttributedString alloc]initWithString:[@"￥" stringByAppendingString:status.pollutantPrice]],
                        [[NSAttributedString alloc]initWithString:[@"￥" stringByAppendingString:status.rubbishPrice]],
                        ];
    self.priceDetailLabel.attributedText = [self attributedStringWithSubAttributedStrs:prices];

    NSArray *status_ = @[
                        [self statusAttributedStringWithIsPaid:status.propertyPaid],
                        [self statusAttributedStringWithIsPaid:status.waterPaid],
                        [self statusAttributedStringWithIsPaid:status.eletricPaid],
                        [self statusAttributedStringWithIsPaid:status.pollutantPaid],
                        [self statusAttributedStringWithIsPaid:status.rubbishPaid],
                        ];
    self.statusDetailLabel.attributedText = [self attributedStringWithSubAttributedStrs:status_];

}

- (NSAttributedString *)statusAttributedStringWithIsPaid:(BOOL)isPaid
{
    return [[NSAttributedString alloc]initWithString:isPaid?@"已缴":@"未缴" attributes:@{NSForegroundColorAttributeName:isPaid?SM_grayColor:HEXCOLOR(@"#FF262D")}];
}

- (NSAttributedString *)attributedStringWithSubAttributedStrs:(NSArray *)attributeStrs
{
    NSUInteger index = 0;
    NSMutableAttributedString *muAtt = [[NSMutableAttributedString alloc]initWithString:@""];
    for (NSAttributedString *att in attributeStrs)
    {

        if (index) {
            [muAtt appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
        }
        [muAtt appendAttributedString:att];

        index ++;
    }
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = SM_SIZE(15);
    [muAtt addAttributes:@{NSParagraphStyleAttributeName:style} range:NSMakeRange(0, muAtt.string.length)];
    return muAtt;
}

- (void)setupConstraints
{
    [self.subjectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(40)));
        make.top.equalTo(@(SM_SIZE(30)));
    }];

    [self.subjectDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.subjectLabel.mas_left);
        make.top.equalTo(self.subjectLabel.mas_bottom).offset(SM_SIZE(15));
        make.bottom.equalTo(@(SM_SIZE(-50)));
//        make.width.equalTo(@(SM_SIZE(200)));
    }];

    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.subjectLabel.mas_top);
    }];

    [self.priceDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel.mas_left);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(SM_SIZE(15));
        make.bottom.equalTo(self.subjectDetailLabel.mas_bottom);
//        make.width.equalTo(@(SM_SIZE(200)));
    }];

    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(SM_SIZE(-40)));
        make.top.equalTo(self.subjectLabel.mas_top);
    }];

    [self.statusDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.statusLabel.mas_left);
        make.top.equalTo(self.statusLabel.mas_bottom).offset(SM_SIZE(15));
        make.bottom.equalTo(self.subjectDetailLabel.mas_bottom);
//        make.width.equalTo(@(SM_SIZE(200)));
    }];
}


#pragma mark - Getters
- (UILabel *)subjectLabel
{
    if (!_subjectLabel) {
        _subjectLabel                = [UILabel new];
        _subjectLabel.font           = SM_CFont(32);
        _subjectLabel.textColor      = SM_lightBlueColor;
        _subjectLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return _subjectLabel;
}

- (UILabel *)subjectDetailLabel
{
    if (!_subjectDetailLabel) {
        _subjectDetailLabel             = [UILabel new];
        _subjectDetailLabel.font        = SM_CFont(30);
        _subjectDetailLabel.textColor   = SM_grayColor;
        _subjectDetailLabel.numberOfLines = 0;
    }
    return _subjectDetailLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel                = [UILabel new];
        _priceLabel.font           = SM_CFont(32);
        _priceLabel.textColor      = SM_lightBlueColor;
        _priceLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

- (UILabel *)priceDetailLabel
{
    if (!_priceDetailLabel) {
        _priceDetailLabel             = [UILabel new];
        _priceDetailLabel.font        = SM_CFont(30);
        _priceDetailLabel.textColor   = SM_grayColor;
        _priceDetailLabel.numberOfLines = 0;
    }
    return _priceDetailLabel;
}
- (UILabel *)statusLabel
{
    if (!_statusLabel) {
        _statusLabel                = [UILabel new];
        _statusLabel.font           = SM_CFont(32);
        _statusLabel.textColor      = SM_lightBlueColor;
        _statusLabel.textAlignment  = NSTextAlignmentCenter;
    }
    return _statusLabel;
}

- (UILabel *)statusDetailLabel
{
    if (!_statusDetailLabel) {
        _statusDetailLabel             = [UILabel new];
        _statusDetailLabel.font        = SM_CFont(30);
        _statusDetailLabel.textColor   = SM_grayColor;
        _statusDetailLabel.numberOfLines = 0;
    }
    return _statusDetailLabel;
}


+ (CGFloat)cellHeight
{
    return SM_SIZE(260);
}

@end
