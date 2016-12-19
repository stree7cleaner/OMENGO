//
//  OMTrackdownSubmitViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/16.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownSubmitViewController.h"
#import "OMPropertyTrackByTableCell.h"
#import "OMTrackdownMonthSubmitTableCell.h"
@interface OMTrackdownSubmitViewController ()
@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UILabel *prizeLabel;
@end

@implementation OMTrackdownSubmitViewController

BOOL loaded = NO;
- (void)viewDidLoad {

    [self.tableView registerClass:[OMTrackdownMonthSubmitTableCell class]
           forCellReuseIdentifier:[OMTrackdownMonthSubmitTableCell cellIdentifier]];

    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.sectionHeaderHeight = SM_SIZE(70);
    self.tableView.sectionFooterHeight = SM_SIZE(20);
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(@0);
    }];

    UIView *bottomBar = [UIView new];
    bottomBar.backgroundColor = SM_whiteColor;
    [self.view addSubview:bottomBar];
    [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(@0);
        make.top.equalTo(self.tableView.mas_bottom);
        make.height.equalTo(@(49));
    }];


    [bottomBar addSubview:self.prizeLabel];
    [bottomBar addSubview:self.confirmButton];
    UIView *line = [UIView new];
    line.backgroundColor = HEXCOLOR(@"F7F7F7");
    [bottomBar addSubview:line];

    [self.prizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(@0);
        make.top.equalTo(@1);
        make.width.equalTo(@(SM_SCREEN_WIDTH/3.f*2));
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(@0);
        make.top.equalTo(@1);
        make.left.equalTo(self.prizeLabel.mas_right);
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@.8);
    }];

    loaded = YES;

}

- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [UIButton new];
        [_confirmButton setTitle:@"下一步" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:SM_whiteColor forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[UIImage imageWithColor:SM_thumeColor] forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[UIImage imageWithColor:RGBACOLOR(0, 0, 0, .26)] forState:UIControlStateDisabled];
        _confirmButton.titleLabel.font = SM_CFont(38);
        [_confirmButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _confirmButton;

}

- (UILabel *)prizeLabel
{
    if (!_prizeLabel) {
        _prizeLabel = [UILabel new];
        _prizeLabel.font = SM_CFont(35);
        _prizeLabel.textAlignment = NSTextAlignmentCenter;
        _prizeLabel.text = @"线下支付";
        _prizeLabel.textColor = HEXCOLOR(@"#FC5E5F");
    }
    return _prizeLabel;
}

- (void)setPrize:(NSString *)price
{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:@"总价：" attributes:@{NSForegroundColorAttributeName:SM_blackColor}];
    if (price.length) {
        price = [@"￥" stringByAppendingString:price];
        NSAttributedString *priceAttri = [[NSAttributedString alloc]initWithString:price attributes:@{NSForegroundColorAttributeName:HEXCOLOR(@"#FC5E5F")}];
        [attri appendAttributedString:priceAttri];
    }
    self.prizeLabel.attributedText = attri;
}


#pragma mark - Actions
- (void)submitAction:(UIButton *)button
{
    NaviPush(@"KTLemonPaymentViewController", (@{@"title":@"支付",@"order":[NSObject new],@"isRepay":@(YES)}));
}

#pragma mark - tableview delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return @"请选择要缴费月份";
    }
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        OMTrackdownMonthSubmitTableCell *cell = [OMTrackdownMonthSubmitTableCell tableViewCellWithTableView:tableView];
        [cell configureCellWithObj:nil];
        return cell;
    }
    return [OMPropertyTrackByTableCell tableViewCellWithTableView:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return [OMTrackdownMonthSubmitTableCell cellHeightWithObject:nil];
    }
    return [OMPropertyTrackByTableCell cellHeight];
}
@end
