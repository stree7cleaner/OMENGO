//
//  OMTrackDownViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackDownViewController.h"
#import "OMPropertyTrackByTableCell.h"
#import "OMTrackdownInfoTableCell.h"
#import "OMTrackdownStatusTableCell.h"
#import "OMTrackdownMonthStatus.h"
#import "OMTrackdownStatusSectionHeader.h"
@interface OMTrackDownViewController () <OMTrackdownStatusSectionHeaderDelegate>
@property (nonatomic, strong) NSArray <OMTrackdownMonthStatus *>*status;
@property (nonatomic, strong) NSMutableDictionary *statusSelections;
@property (nonatomic, strong) UIButton *confirmButton;


@end

@implementation OMTrackDownViewController



- (void)viewDidLoad {

    [self.tableView registerClass:[OMTrackdownStatusTableCell class]
           forCellReuseIdentifier:[OMTrackdownStatusTableCell cellIdentifier]];
    [self.tableView registerClass:[OMTrackdownStatusSectionHeader class]
forHeaderFooterViewReuseIdentifier:[OMTrackdownStatusSectionHeader identifier]];
    _statusSelections = [NSMutableDictionary dictionary];

    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"ic_trackdown_history"] style:UIBarButtonItemStylePlain target:self action:@selector(tapHistoryItem:)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

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

    [bottomBar addSubview:self.confirmButton];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];


    //假数据
    _status = [OMTrackdownMonthStatus fakeData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2 + self.status.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section >= 2) {
        if (![self.statusSelections[[@(section) stringValue]] boolValue]) {
            return 0;
        }
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        OMPropertyTrackByTableCell *cell = [OMPropertyTrackByTableCell tableViewCellWithTableView:tableView];
        return cell;
    }

    if (indexPath.section == 1) {
        OMTrackdownInfoTableCell *cell = [OMTrackdownInfoTableCell tableViewCellWithTableView:tableView];
        return cell;
    }

    if (indexPath.section >= 2) {
        OMTrackdownStatusTableCell *cell = [OMTrackdownStatusTableCell tableViewCellWithTableView:tableView];
        [cell configureCellWithObj:self.status[indexPath.section-2]];
        return cell;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return [OMPropertyTrackByTableCell cellHeight];
    }

    if (indexPath.section == 1) {
        return [OMTrackdownInfoTableCell cellHeight];
    }

    if (indexPath.section >= 2) {

        return !_status.count?0:[tableView fd_heightForCellWithIdentifier:[OMTrackdownStatusTableCell cellIdentifier] cacheByIndexPath:indexPath configuration:^(id cell) {
            [cell configureCellWithObj:self.status[indexPath.section-2]];
        }];
    }
    return DBL_EPSILON;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section >= 2) {
        return SM_SIZE(100.1);
    }
    return SM_SIZE(20.1);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        return SM_SIZE(20.1);
    }else {
        return SM_SIZE(.1);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section >= 2) {
        OMTrackdownStatusSectionHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:[OMTrackdownStatusSectionHeader identifier]];
        header.isAllPaid = [self.status[section-2] isAllPaid];
        header.section = section;
        header.delegate = self;
        header.isOpen = [self.statusSelections[[@(section) stringValue]] boolValue];
        header.element = [self.status[section-2] time];
        return header;
    }
    return nil;
}

#pragma mark - Actions
- (void)tapHistoryItem:(id)sender
{
    NaviPush(@"OMTrackdownHistoryViewController", @{@"title":@"缴费记录"});
}

- (void)submitAction:(UIButton *)sender
{
    NaviPush(@"OMTrackdownSubmitViewController", @{@"title":@"缴费确认"});
}

#pragma mark - OMTrackdownStatusSectionHeader delegate
- (void)didSelectHeaderViewAtSection:(NSUInteger)section isOpen:(BOOL)open
{
    [self.statusSelections setObject:@(open) forKey:[@(section) stringValue]];
    [self.tableView reloadData];
}

#pragma mark - Getters
- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [UIButton new];
        [_confirmButton setTitle:@"去缴费" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:SM_whiteColor forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[UIImage imageWithColor:SM_thumeColor] forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[UIImage imageWithColor:RGBACOLOR(0, 0, 0, .26)] forState:UIControlStateDisabled];
        _confirmButton.titleLabel.font = SM_CFont(38);
        [_confirmButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _confirmButton;
    
}


@end
