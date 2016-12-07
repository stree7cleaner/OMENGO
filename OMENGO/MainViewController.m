//
//  KTMainViewController.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/10/31.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "MainViewController.h"

#import "BaseNavigationController.h"
#import "TabBarViewController.h"

#import "MainConfigure.h"
#import "Storage.h"


@interface MainViewController ()

@property (nonatomic, weak) UIViewController *currentVCtrl;
@property (nonatomic, assign) BOOL isTransitioning;

@end

@implementation MainViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configure];

    }
    return self;
}

- (void)configure
{
//    if ([KTSystemStorage isLogin]) {
        //已登录,加载HomeVC
        _currentVCtrl = self.tabbarCtrl;

//    }else {
//        //未登录,加载登录VC
//        _currentVCtrl = self.loginNaviCtrl;
//
//    }
    [self.view addSubview:self.currentVCtrl.view];


}


- (UIViewController *)currentViewController
{
    return _currentVCtrl;
}

- (void)transitionViewControllerWithAnimated:(BOOL)animated
{
    UIViewController *targetCtrl = nil;
    targetCtrl = _currentVCtrl == self.tabbarCtrl ? self.loginNaviCtrl : self.tabbarCtrl;

    if (!targetCtrl || !_currentVCtrl || _isTransitioning)
    {
        return;
    }

    //登录与非登录取反，并保存
    _isTransitioning = YES;

    [self transitionFromViewController:_currentVCtrl
                      toViewController:targetCtrl
                              duration:animated ?.6f:0
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:nil
                            completion:^(BOOL finished) {

                                _isTransitioning = NO;
                                [_currentVCtrl removeFromParentViewController];
                                _currentVCtrl = targetCtrl;
                            }];
    
}


- (BaseNavigationController *)loginNaviCtrl
{
    if (!_loginNaviCtrl) {
        id controller = navigationCtrlMake([UIViewController new]);
        [self addChildViewController:controller];
        _loginNaviCtrl = controller;
    }
    return _loginNaviCtrl;
}


- (TabBarViewController *)tabbarCtrl
{
    if (!_tabbarCtrl) {
        TabBarViewController *controller =  [TabBarViewController new];
        _tabbarCtrl = controller;
        [self addChildViewController:_tabbarCtrl];

    }
    return _tabbarCtrl;
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
