//
//  OMHUD.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMHUD.h"
#import <UIView+Toast.h>
#import "Navigator.h"
#import "MainConfigure.h"
@implementation OMHUD

+ (void)showMessage:(NSString *)msg
{
    CSToastStyle *style = [[CSToastStyle alloc]initWithDefaultStyle];
    style.backgroundColor = SM_blackColor;
    style.messageColor = SM_thumeColor;
    style.messageFont = SM_SFont(33);
    style.displayShadow = YES;
    [[[Navigator currentNavigationController].viewControllers.lastObject view] makeToast:msg
                                                                                duration:2.0
                                                                                position:CSToastPositionBottom
                                                                                   style:style];
}

@end
