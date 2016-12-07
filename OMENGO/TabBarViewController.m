//
//  TabBarViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "TabBarViewController.h"
#import "BaseNavigationController.h"
#import "OMPersonalCenterViewController.h"
#import "OMMallViewController.h"
#import "OMShoppingCartViewController.h"
#import "OMPropertyViewController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (instancetype)init
{
    if (self = [super init]) {
        [self addChildVc:[[OMMallViewController alloc] init] title:@"商城" image:@"btn_Personal-Center" selectedImage:@"btn_Personal-Center"];
        [self addChildVc:[[OMPropertyViewController alloc] init] title:@"我的物业" image:@"btn_Personal-Center" selectedImage:@"btn_Personal-Center"];
        [self addChildVc:[[OMShoppingCartViewController alloc] init] title:@"购物车" image:@"btn_Personal-Center" selectedImage:@"btn_Personal-Center"];
        [self addChildVc:[[OMPersonalCenterViewController alloc] init] title:@"个人中心" image:@"btn_Personal-Center" selectedImage:@"btn_Personal-Center_Press"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if ([self.tabBar respondsToSelector:@selector(setTranslucent:)]) {
        self.tabBar.translucent = NO;
    }

}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;

    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithColor:SM_thumeColor];


    //customFont
    UIFont *customFont = SM_CBFont(24);

    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName : SM_lightGrayColor,
                                                 NSFontAttributeName            : customFont
                                                 }
                                      forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{
                                                 NSForegroundColorAttributeName : SM_thumeColor,
                                                 NSFontAttributeName            : customFont
                                                 }
                                      forState:UIControlStateSelected];

    //    childVc.view.backgroundColor = RandomColor; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载

    // 添加子控制器
    [self addChildViewController:navigationCtrlMake(childVc)];

    [childVc.tabBarController.tabBar setTintColor:SM_thumeColor];
    [childVc.tabBarController.tabBar setUnselectedItemTintColor:SM_lightGrayColor];
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
