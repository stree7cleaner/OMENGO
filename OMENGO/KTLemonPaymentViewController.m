//
//  KTLemonPaymentViewController.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/12/12.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "KTLemonPaymentViewController.h"
#import "KTPaySelectionTableCell.h"
//#import "KTPayUtils.h"
//#import "WXPayConfig.h"
@interface KTLemonPaymentViewController ()
@property (nonatomic, strong, readwrite) UIButton              *confirmButton;
@property (nonatomic, strong) NSArray *selections;
@property (nonatomic, strong) NSMutableDictionary *selectionResults;
@end

@implementation KTLemonPaymentViewController

- (void)viewDidLoad {
    _selections =   @[
                      @{@"icon":@"icon_wx_paySelection",@"title":@"微信支付",@"description":@"推荐安装微信5.0及以上版本使用"},
                      @{@"icon":@"icon_alipay_paySelection",@"title":@"支付宝",@"description":@"推荐有支付宝账号的用户使用"},
                      ];
    _selectionResults = [@{
                           [NSIndexPath indexPathForRow:0 inSection:1]:@(YES),
                           [NSIndexPath indexPathForRow:0 inSection:1]:@(NO),
                           }mutableCopy];

    [super viewDidLoad];

    self.fd_interactivePopDisabled = YES;

    [self.view addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@(SM_SIZE(100)));
    }];

    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.bottom.equalTo(self.confirmButton.mas_top);
    }];
    // Do any additional setup after loading the view.

//    @weakify(self);
//    [SMNotificationMonitorRACSignal(SM_WXPaySuccessNotification) subscribeNext:^(id x) {
//        @strongify(self);
//        [self checkPayResult];
//    }];
//
//    [SMNotificationMonitorRACSignal(SM_WXPayErrorNotification) subscribeNext:^(id x) {
//        [HUD_Utils HUDHide];
//        [KTAlertView alertWithMessage:@"支付失败" Title:@"提示" ButtonTitles:nil withClickBlock:nil];
//    }];

}


- (void)checkPayResult
{
//    @weakify(self);
//    [KTHttpUtils GET:@"ec_order/getPaymentResult"
//          parameters:@{@"sn":self.order.sn}
//            progress:nil
//          completion:^(id responseObject, BOOL isSuccess, NSString *message) {
//              if (isSuccess)
//              {
//                  [KTAlertView alertWithMessage:@"支付成功!"
//                                          Title:@"提示"
//                                   ButtonTitles:nil
//                                 withClickBlock:^(NSUInteger indexOfButton) {
//                      @strongify(self);
//                      [self backAction];
//                      [HUD_Utils HUDHide];
//                  }];
//              }
//              else {
//                  [KTAlertView alertWithMessage:@"支付结果查询失败,请到下单记录中查看结果，勿要重复支付"
//                                          Title:@"提示"
//                                   ButtonTitles:@[@"重试"]
//                                 withClickBlock:^(NSUInteger indexOfButton) {
//                                     @strongify(self);
//                                     if (indexOfButton == 1) {
//                                         [self checkPayResult];
//                                     }else {
//                                         [HUD_Utils HUDHide];
//                                     }
//                  }];
//              }
//          }];
}

- (void)backAction
{
    if (_isRepay) {
        [super backAction];
    }else
    NaviPopToRoot(YES);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    return self.selections.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        BaseTableCell *cell = [BaseTableCell tableViewCellWithTableView:tableView];
        cell.textLabel.font = SM_CBFont(33);
        cell.textLabel.textColor = SM_lightBlueColor;
        cell.textLabel.text = @"订单总金额";
        cell.detailTextLabel.font = SM_CFont(33);
        cell.detailTextLabel.textColor = SM_lightBlueColor;
//        cell.detailTextLabel.text = [@"￥" stringByAppendingString:self.order.price?self.order.price:@"0"];
        return cell;
    }else if (indexPath.section == 1) {
        KTPaySelectionTableCell *cell = [KTPaySelectionTableCell tableViewCellWithTableView:tableView];
        cell.iconImageView.image = SMPNGImage(_selections[indexPath.row][@"icon"]);
        cell.titleLabel.text = _selections[indexPath.row][@"title"];
        cell.descriptionLabel.text = _selections[indexPath.row][@"description"];
        cell.chosen = [_selectionResults[indexPath] boolValue];
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        for (id<NSCopying> key in self.selectionResults.allKeys) {
            [self.selectionResults setObject:@(NO) forKey:key];
        }
        [self.selectionResults setObject:@(YES) forKey:indexPath];
        [self.tableView reloadData];
    }

}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SM_SCREEN_WIDTH, SM_SIZE(80))];
        label.textColor = SM_lightBlueColor;
        label.font = SM_CBFont(32);
        label.text = @"    在线支付";
        label.backgroundColor = SM_whiteColor;

        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, SM_SIZE(80) - 2, SM_SCREEN_WIDTH, 1)];
        line.backgroundColor = SM_lightGrayColor;//HEXCOLOR(@"#F7F7F7");
        [label addSubview:line];
        return label;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section) {
        UIView *foot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SM_SCREEN_WIDTH, SM_SIZE(50))];
        foot.backgroundColor = SM_whiteColor;
        return foot;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section) {
        return SM_SIZE(50);
    }
    return SM_SIZE(20);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section) {
        return SM_SIZE(80);
    }
    return DBL_EPSILON;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return SM_SIZE(120);
    }else if (indexPath.section == 1) {
        return [KTPaySelectionTableCell cellHeight];
    }
    return DBL_EPSILON;
}

#pragma mark - Getters
- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [UIButton new];
        [_confirmButton setTitle:@"立即支付" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:SM_whiteColor forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[UIImage imageWithColor:SM_thumeColor] forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[UIImage imageWithColor:RGBACOLOR(0, 0, 0, .26)] forState:UIControlStateDisabled];
        _confirmButton.titleLabel.font = SM_CFont(35);
        [_confirmButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _confirmButton;
}

#pragma mark - Actions
- (void)submitAction:(UIButton *)button
{
    NSUInteger indexOfButton = 0;
    for (NSIndexPath *indexPath in self.selectionResults) {
        if ([self.selectionResults[indexPath] boolValue]) {
            indexOfButton = indexPath.row;
            break;
        }
    }

    //安全性检测
//    if (!_order) {
//        [HUD_Utils HUDInfo:@"订单不存在!"];
//        return;
//    }

    //请求支付
    if (indexOfButton == 0) {
//        [HUD_Utils HUDShieldLoading:@"正在支付"];
//        [KTPayUtils WXPayWithOrder:_order onCompletion:^(BOOL success) {
//            success?:[HUD_Utils HUDError:@"支付失败"];
//        }];
    }else if (indexOfButton == 1){
//        [KTPayUtils AlipayWithOrder:_order onCompletion:^(BOOL success) {
//            
//        }];
    }

//    [HUD_Utils HUDShieldLoading:@"正在支付"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

    });
}

@end
