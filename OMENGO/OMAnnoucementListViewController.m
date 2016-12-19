//
//  OMAnnoucementListViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMAnnoucementListViewController.h"
#import "OMAnnouncement.h"
#import "OMAnnoucementListTableCell.h"
@interface OMAnnoucementListViewController ()
@property (nonatomic, strong) NSArray <OMAnnouncement*>*announces;
@end

@implementation OMAnnoucementListViewController

- (void)viewDidLoad {

    [self.tableView registerClass:[OMAnnoucementListTableCell class]
           forCellReuseIdentifier:[OMAnnoucementListTableCell cellIdentifier]];

    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImageView *imageView = [[UIImageView alloc]initWithImage:SMImage(@"gonggaobanner.jpg", @"")];
    [imageView setFrame:CGRectMake(0, 0, SM_SCREEN_WIDTH, SM_SCREEN_WIDTH*5.f/18)];
    self.tableView.tableHeaderView = imageView;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _announces = [OMAnnouncement fakeData];

}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.announces.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OMAnnoucementListTableCell *cell = [OMAnnoucementListTableCell tableViewCellWithTableView:tableView];
    [cell configureCellWithObj:self.announces[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return !_announces.count?0:[tableView fd_heightForCellWithIdentifier:[OMAnnoucementListTableCell cellIdentifier] cacheByIndexPath:indexPath configuration:^(id cell) {
        [cell configureCellWithObj:self.announces[indexPath.row]];
    }];
}

@end
