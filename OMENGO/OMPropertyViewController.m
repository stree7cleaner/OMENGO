//
//  OMPropertyViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMPropertyViewController.h"
#import "OMPropertyCategoryTableCell.h"
@interface OMPropertyViewController ()

@end

@implementation OMPropertyViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.fd_prefersNavigationBarHidden = YES;

    UIImageView *imageView = [[UIImageView alloc]initWithImage:SMImage(@"01-banner.png", @"")];
    [imageView setFrame:CGRectMake(0, 0, SM_SCREEN_WIDTH, SM_SCREEN_WIDTH*5.f/12)];
    self.tableView.tableHeaderView = imageView;



}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OMPropertyCategoryTableCell *cell = [OMPropertyCategoryTableCell tableViewCellWithTableView:tableView];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [OMPropertyCategoryTableCell cellHeight];
}


@end
