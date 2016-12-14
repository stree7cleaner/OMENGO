//
//  BaseViewController.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/10/31.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseViewController.h"

NSString * const KTJobNeedRefreshNotificationKey = @"JOB_NEED_REFRESH_NOTIFICATION";
NSString * const KTInspectionHistoryNeedRefreshNotificationKey = @"INSPECTION_NEED_REFRESH_NOTIFICATION";
NSString * const KTJobPeriodicNeedRefreshNotificationKey = @"JOB_PERIODIC_NEED_REFRESH_NOTIFICATION";
NSString * const KTOfflineDataNeedRefreshNotificationKey = @"OFFLINEDATA_NEED_REFRESH_NOTIFICATION";

@interface BaseViewController ()

@end

@implementation BaseViewController

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //    if([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]){
    //        self.edgesForExtendedLayout = UIRectEdgeNone;
    //    }


    self.view.backgroundColor = SM_backGroundColor;

    if (self.navigationController.viewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_back_black"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    }

    if (_isPresented) {
        [self setupLeftCancelBarButton];
    }


}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}


- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [Storage removeImageMemoryCache];
}

- (void)setupLeftCancelBarButton
{
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_cancel_medium"]
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(backAction)];
}



- (void)backAction
{
    if (self.navigationController.viewControllers.count > 1) {

        NaviPopAnimated(YES);

    }
    else {
        NaviDismiss(^{

        });
    }

}

- (void)dealloc
{
//    [KTSystemStorage removeImageMemoryCache];
//    [self.task cancel];
    NSLog(@"%@__dealloc",[self class]);
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
