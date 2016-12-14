//
//  OMMallViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMMallViewController.h"
#import "OMMallBannerView.h"
#import "OMMallCategoryTableCell.h"
#import "OMMallRecommendTableCell.h"
#import "OMMallADTableCell.h"
@interface OMMallViewController ()
@property (nonatomic, strong) OMMallCategoryTableCell *categoryCell;
@property (nonatomic, strong) OMMallRecommendTableCell *recommendCell;
@end

@implementation OMMallViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.fd_prefersNavigationBarHidden = YES;

    OMMallBannerView *banner = [[OMMallBannerView alloc]initWithFrame:CGRectMake(0, 0, SM_SCREEN_WIDTH, SM_SIZE(350))];
    [banner configureWithObject:@[@"cycle_ad_00.jpg",@"cycle_ad_01.jpg"] IsLocal:YES];
    [banner.addressView setAddress:@"嘉信城市花园1期"];
    self.tableView.tableHeaderView = banner;
    self.tableView.sectionFooterHeight = SM_SIZE(15);
    self.tableView.sectionHeaderHeight = SM_SIZE(1);

    _categoryCell = [OMMallCategoryTableCell tableViewCellWithTableView:self.tableView];
    _recommendCell = [OMMallRecommendTableCell tableViewCellWithTableView:self.tableView];


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 2) {
//        return 4;
//    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:return self.categoryCell;
        case 1:return self.recommendCell;
        case 2:return [OMMallADTableCell tableViewCellWithTableView:tableView];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:return [OMMallCategoryTableCell cellHeight];
        case 1:return [OMMallRecommendTableCell cellHeight];
        case 2:return [OMMallADTableCell cellHeight];
    }
    return [OMMallCategoryTableCell cellHeight];
}





@end
