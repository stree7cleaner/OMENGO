//
//  OMMallViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMMallViewController.h"
#import "OMCycleADView.h"
@interface OMMallViewController ()

@end

@implementation OMMallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.fd_prefersNavigationBarHidden = YES;

    OMCycleADView *adView = [[OMCycleADView alloc]initWithFrame:CGRectMake(0, 0, SM_SCREEN_WIDTH, SM_SIZE(350))];
    [adView setImages:@[@"cycle_ad_00.jpg",@"cycle_ad_01.jpg"] IsLocal:YES];
    self.tableView.tableHeaderView = adView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
