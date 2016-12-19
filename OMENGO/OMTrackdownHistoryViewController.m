//
//  OMTrackdownHistoryViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownHistoryViewController.h"
#import "OMTrackdownHistory.h"
#import "OMTrackdownHistoryTableCell.h"
@interface OMTrackdownHistoryViewController ()
@property (nonatomic, strong) NSArray <OMTrackdownHistory*>*historys;
@end

@implementation OMTrackdownHistoryViewController

- (void)viewDidLoad {

    [self.tableView registerClass:[OMTrackdownHistoryTableCell class]
           forCellReuseIdentifier:[OMTrackdownHistoryTableCell cellIdentifier]];

    [super viewDidLoad];

    self.tableView.sectionFooterHeight = SM_SIZE(15);
    self.tableView.sectionHeaderHeight = CGFLOAT_MIN;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _historys = [OMTrackdownHistory fakeData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _historys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OMTrackdownHistoryTableCell *cell = [OMTrackdownHistoryTableCell tableViewCellWithTableView:tableView];
    [cell configureCellWithObj:self.historys[indexPath.section]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return !_historys.count?0:[tableView fd_heightForCellWithIdentifier:[OMTrackdownHistoryTableCell cellIdentifier] cacheByIndexPath:indexPath configuration:^(id cell) {
        [cell configureCellWithObj:self.historys[indexPath.section]];
    }];
}



@end
