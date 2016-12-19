//
//  BaseTableCell.m
//  Follows
//
//  Created by liangshangjia on 16/5/11.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//

#import "BaseTableCell.h"

@implementation BaseTableCell

+ (instancetype)tableViewCellWithTableView:(UITableView *)aTableView
{
    BaseTableCell *cell = [aTableView dequeueReusableCellWithIdentifier:[self cellIdentifier]];
    if (nil == cell) {
        cell = [[[self class] alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self cellIdentifier]];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self configure];
    }
    return self;
}


- (void)configureCellWithObj:(id)obj
{
    
}

- (void)configure
{
//    self.clipsToBounds                  = YES;
    self.selectionStyle                 = UITableViewCellSelectionStyleNone;
    self.backgroundColor                = SM_whiteColor;
    self.contentView.backgroundColor    = SM_whiteColor;
    self.translatesAutoresizingMaskIntoConstraints = NO;

    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = HEXCOLOR(@"#F6F6F6");
        _bgView.hidden = YES;
    }
    return _bgView;
}

#pragma mark - Class
+ (NSString *)cellIdentifier
{
    return  NSStringFromClass([self class]);
}

+ (CGFloat)cellHeight
{
    return DBL_EPSILON;
}

- (void)dealloc
{
    NSLog(@"%@__dealloc",NSStringFromClass(self.class));
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (_canHighLight) {
        self.bgView.hidden = !highlighted;
    }
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType
{
    [super setAccessoryType:accessoryType];
    if (accessoryType == UITableViewCellAccessoryDisclosureIndicator) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[[UIImage imageNamed:@"ic_arrow_right_brown"]imageWithColor:HEXCOLOR(@"#C1C1C1")]];
        [imageView sizeToFit];
        self.accessoryType = UITableViewCellAccessoryNone;
        self.accessoryView = imageView;
    }
}
@end
