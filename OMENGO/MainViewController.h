//
//  KTMainViewController.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/10/31.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseViewController.h"
@class BaseNavigationController,TabBarViewController;
@interface MainViewController : BaseViewController

@property (nonatomic, weak) TabBarViewController *tabbarCtrl;
@property (nonatomic, weak) BaseNavigationController *loginNaviCtrl;


- (void)transitionViewControllerWithAnimated:(BOOL)animated;
- (UIViewController *)currentViewController;
@end
