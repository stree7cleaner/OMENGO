//
//  KTAlertView.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/15.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "KTAlertView.h"
#import "MainConfigure.h"
#define kAlertButton_baseTag 200

@interface KTAlertView () <UIAlertViewDelegate>

@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic , copy) KTAlertViewBlock block;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *title;


@end

@implementation KTAlertView

+ (KTAlertView *)alertWithMessage:(NSString *)msg Title:(NSString *)title ButtonTitles:(NSArray *)buttonTitles withClickBlock:(KTAlertViewBlock)block
{
    KTAlertView *alerView = [KTAlertView new];
    [alerView setFrame:SMKeyWindow.bounds];
    alerView.titles = buttonTitles;
    alerView.message = msg;
    alerView.title = title;
    alerView.block = [block copy];

    [alerView configure];
    [alerView showInView:SMKeyWindow];

    return alerView;
}

- (void)configure
{

    _backgroundView = [UIView new];
    [self addSubview:self.backgroundView];

    _contentView = [UIView new];
    _contentView.backgroundColor = HEXCOLOR(@"#FAFAFA");
    [self addSubview:self.contentView];

    _titleLabel =[UILabel new];
    _titleLabel.font = SM_CBFont(36);
    _titleLabel.textColor = SM_blackColor;
    _titleLabel.numberOfLines = 0;
    _titleLabel.text = self.title;
    [self.contentView addSubview:self.titleLabel];

    _messageLabel = [UILabel new];
    _messageLabel.font = SM_CFont(32);
    _messageLabel.textColor = SM_grayColor;
    _messageLabel.numberOfLines = 0;
    _messageLabel.text = self.message;
    [self.contentView addSubview:self.messageLabel];

    NSMutableArray *titles = [NSMutableArray arrayWithCapacity:_titles.count + 1];
    [titles addObject:_titles.count?@"取消":@"确定"];
    for (NSInteger i = _titles.count - 1; i >= 0; i --) {
        [titles addObject:_titles[i]];
    }
    _titles = titles;

    _buttons = [NSMutableArray arrayWithCapacity:_titles.count];
    for (NSString *title in _titles) {
        UIButton *button = [self buttonMake:title];
        button.tag = kAlertButton_baseTag + [_titles indexOfObject:title];
        [self.contentView addSubview:button];
        [_buttons addObject:button];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }

    [self makeCosntraints];
}

- (void)makeCosntraints
{
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];

    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(88)));
        make.right.equalTo(@(SM_SIZE(-88)));
        make.centerY.equalTo(self.mas_centerY);
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(SM_SIZE(44)));
        make.right.equalTo(@(SM_SIZE(-44)));
        make.top.equalTo(@(SM_SIZE(44)));
    }];

    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.equalTo(self.titleLabel.mas_right);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(SM_SIZE(30));
    }];

    for (NSInteger i = _buttons.count - 1; i >= 0; i --)
    {
        BOOL isFirst = _buttons.count - 1  == i;
        UIButton *button = [self.contentView viewWithTag:kAlertButton_baseTag + i];

        if (self.titles.count > 2)
        {
            BOOL isLast = i == 0;
            UIButton *pervious_button = [self.contentView viewWithTag:kAlertButton_baseTag + i + 1];

            UIView *line = [UIView new];
            line.backgroundColor = RGBACOLOR(0, 0, 0, .12);
            [self.contentView addSubview:line];

            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                if (isFirst) {
                    make.top.equalTo(self.messageLabel.mas_bottom).offset(SM_SIZE(30));
                }else {
                    make.top.equalTo(pervious_button.mas_bottom);
                }
                make.height.equalTo(@.5);
                make.left.right.equalTo(@0);
            }];

            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                if (isLast){
                    make.bottom.equalTo(@0);
                }
                make.top.equalTo(line.mas_bottom);
                make.left.equalTo(@(SM_SIZE(0)));
                make.right.equalTo(@(SM_SIZE(0)));
                make.height.equalTo(@(SM_SIZE(90)));
            }];
        }else {
            [button mas_makeConstraints:^(MASConstraintMaker *make)
             {
                 if (isFirst) {
                     make.right.equalTo(@(SM_SIZE(-16)));
                     make.bottom.equalTo(@(SM_SIZE(-44)));
                 }else {
                     UIButton *pervious_button = [self.contentView viewWithTag:kAlertButton_baseTag + i + 1];
                     make.right.equalTo(pervious_button.mas_left).offset(SM_SIZE(-30));
                 }
                 make.top.equalTo(self.messageLabel.mas_bottom).offset(SM_SIZE(30));
                 make.height.equalTo(@(SM_SIZE(50)));
             }];
        }
    }
}


- (UIButton *)buttonMake:(NSString *)title
{
    UIButton *button = [UIButton new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:SM_lightBlueColor forState:UIControlStateNormal];
    [button setTitleColor:SM_blackColor forState:UIControlStateHighlighted];
    [button.titleLabel setFont:SM_CBFont(30)];
    [button setContentEdgeInsets:UIEdgeInsetsMake(SM_SIZE(8), SM_SIZE(15), SM_SIZE(8), SM_SIZE(15))];
    [button setBackgroundImage:[UIImage imageWithColor:self.contentView.backgroundColor] forState:UIControlStateNormal];
    return button;
}


#pragma mark - Actions
- (void)buttonClick:(UIButton *)button
{
    NSUInteger index = button.tag - kAlertButton_baseTag;
    if (index) {
        if (self.block) {
            self.block(_buttons.count - index);
        }
    }else {
        if (self.block) {
            self.block(index);
        }
    }
    [self dismiss];
}


- (void)showInView:(UIView *)aView
{
    self.backgroundView.backgroundColor = RGBACOLOR(0, 0, 0, 0);
    self.contentView.alpha = .3;
    self.contentView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    [aView addSubview:self];
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundView.backgroundColor = RGBACOLOR(0, 0, 0, .7);
        self.contentView.transform = CGAffineTransformIdentity;
        self.contentView.alpha = 1;
    } completion:^(BOOL finished) {

    }];
}


- (void)dismiss
{
    [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundView.backgroundColor = RGBACOLOR(0, 0, 0, 0);
        self.contentView.alpha = 0;
        self.contentView.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.block) {
        self.block(buttonIndex);
    }
}

@end
