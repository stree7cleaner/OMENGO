//
//  Navigator.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "Navigator.h"
#import <UIKit/UIKit.h>

#import "BaseNavigationController.h"
#import "TabBarViewController.h"
#import "MainViewController.h"
#import "Storage.h"


#define kNSingleTon                  [Navigator singleton]

#define kMainVCtrl                      ((MainViewController *)SMKeyWindow.rootViewController)

#define kNavigations                    kNSingleTon->_navigations

#define kIsLogin                        (kMainVCtrl.currentViewController == kMainVCtrl.loginNaviCtrl)


@implementation Navigator
{
    UITabBarController  *_mainVC;
    NSMutableArray      *_navigations;
}

static Navigator *shareInstance = nil;
+ (instancetype)singleton
{
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{

        shareInstance = [[self alloc] init];
        shareInstance -> _navigations  = [NSMutableArray arrayWithCapacity:0];
    });

    return shareInstance;
}



+ (void)startLoading
{
    SMKeyWindow.rootViewController = [MainViewController new];
}


+ (void)pushActionWithTargetName:(NSString *)target
                    propertyInfo:(NSDictionary *)info
{
    [self pushActionWithTargetName:target propertyInfo:info animated:YES];
}


+ (void)pushActionWithTargetName:(NSString *)target
                    propertyInfo:(NSDictionary *)info
                        animated:(BOOL)animated
{
    UIViewController *vc = [self controllerWithTargetName:target propertyInfo:info];
    vc.hidesBottomBarWhenPushed = YES;
    [[self currentNavigationController] pushViewController:vc
                                                  animated:animated];
}


+ (void)presentActionWithTargetName:(NSString *)target
                       propertyInfo:(NSDictionary *)info
{
    [self presentActionWithTargetCtrl:[self controllerWithTargetName:target propertyInfo:info]
                             animated:NO];


}


+ (void)presentActionWithTargetCtrl:(UIViewController *)targetCtrl
                           animated:(BOOL)animated
{
    UINavigationController *navi = navigationCtrlMake(targetCtrl);
    [[self currentNavigationController] presentViewController:navi animated:YES completion:nil];
    [kNavigations addObject:navi];
}


+ (void)loginActionWithCompletion:(void (^)())completion
{
    if (!kIsLogin) {
        !completion ?({}): ({completion = nil;});
        return;
    }
    ;
    /// Required - 登录成功就注册 DeviceToken
//    if ([SystemStorage isLogin]) {

        //        [SystemStorage registerNotification];

//    }
    [kMainVCtrl transitionViewControllerWithAnimated:YES];
}


+ (void)logoutActionWithCompletion:(void (^)())completion
{
//    [SystemStorage saveAuthorizationToken:nil];
    SMUserDefaultSet(@"IS_LOGIN", @(NO));
    [kMainVCtrl transitionViewControllerWithAnimated:YES];

    //登出 注销 DeviceToken
    //    [SystemStorage unregisterNotification];
//    [JPUSHService setAlias:@"IOS_UNREGISTER_NOTIFICATION" callbackSelector:NULL object:nil];
    !completion ?: completion();
}


+ (void)dismissActionWithComplection:(void (^)())completion
{
    [self dismissActionAnimated:YES onComplection:completion];
}

+ (void)dismissActionAnimated:(BOOL)animated
                onComplection:(void (^)())completion
{
    if (!kNavigations.count) {
        return;
    }
    [[self currentNavigationController] dismissViewControllerAnimated:animated completion:completion];
    [kNavigations removeLastObject];
}





+ (void)popActionToController:(NSString *)target
{
    UIViewController *targetController = nil;
    for (UIViewController *controller in ((UINavigationController *)[self currentNavigationController]).viewControllers) {
        if ([controller isKindOfClass:NSClassFromString(target)]) {
            targetController = controller;
            break;
        }
    }
    !targetController ?({}): [[self currentNavigationController] popToViewController:targetController animated:YES];
}


+ (void)popAnimated:(BOOL)animated
{
    if ([[self currentNavigationController]viewControllers].count < 2) {
        return;
    }
    [[self currentNavigationController] popViewControllerAnimated:animated];
}


+ (void)popToRoot:(BOOL)animated
{
    [[self currentNavigationController]popToRootViewControllerAnimated:animated];
}


+ (UINavigationController *)currentNavigationController
{
    if (kNavigations.count) {
        return [kNavigations lastObject];
    }
    return  kMainVCtrl.currentViewController == kMainVCtrl.loginNaviCtrl ? kMainVCtrl.loginNaviCtrl : (UINavigationController *)kMainVCtrl.tabbarCtrl.selectedViewController;
}


+ (id)controllerWithTargetName:(NSString *)target propertyInfo:(NSDictionary *)info
{
    Class class             = NSClassFromString(target);
    UIViewController *vc    = [[class alloc]init];

    for (NSString *key in info.allKeys) {
        id obj = info[key];
        [vc setValue:obj forKey:key];
    }
    return vc;
}
@end
