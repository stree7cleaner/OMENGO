//
//  KTNavigationController.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/10/31.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseNavigationController.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //navigationBar更倾向于可以隐藏，使得隐藏与显示的切换更流畅
    //self.fd_prefersNavigationBarHidden = NO;

//    self.navigationBar.barStyle = UIBarStyleBlackOpaque;
//    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:SM_whiteColor]
//                             forBarMetrics:UIBarMetricsDefault];

    if ([self.navigationBar respondsToSelector:@selector(setTranslucent:)]) {
        [self.navigationBar setTranslucent:NO];
    }
    [self.navigationBar setBackgroundColor:SM_whiteColor];
    NSMutableDictionary *textAttrs              = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]   = SM_blackColor;
    textAttrs[NSFontAttributeName]              = SM_CBFont(40);

    [self.navigationBar setTitleTextAttributes:textAttrs];
    [self.navigationBar setTintColor:SM_blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

- (void)dealloc
{
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
