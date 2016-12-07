//
//  Navigator.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseModel.h"

#define NaviPush(targetStr,info)     [Navigator pushActionWithTargetName:targetStr propertyInfo:info]
#define NaviPushAnimated(targetStr,info,BOOLEAN)     [Navigator pushActionWithTargetName:targetStr propertyInfo:info animated:BOOLEAN]
#define NaviPresent(targetStr,info)  [Navigator presentActionWithTargetName:targetStr propertyInfo:info]
#define NaviPresentCtrl(targetCtrl,isAnimated) [Navigator presentActionWithTargetCtrl:targetCtrl animated:isAnimated]
#define NaviDismiss(completionBlock) [Navigator dismissActionWithComplection:completionBlock]
#define NaviDismissAnimated(BOOLEAN,completionBlock) [Navigator dismissActionAnimated:BOOLEAN onComplection:completionBlock]
#define NaviPopTo(targetStr)         [Navigator popActionToController:targetStr]
#define NaviPopAnimated(BOOLEAN)     [Navigator popAnimated:BOOLEAN]
#define NaviPopToRoot(animated)      [Navigator popToRoot:animated]
#define NaviLogin(completionBlock)   [Navigator loginActionWithCompletion:completionBlock]
#define NaviLogout(completionBlock)  [Navigator logoutActionWithCompletion:completionBlock]

@class UINavigationController;
@interface Navigator : BaseModel
/**
 *  进入主界面
 */
+ (void)startLoading;


+ (void)pushActionWithTargetName:(NSString *)target
                    propertyInfo:(NSDictionary *)info;


+ (void)pushActionWithTargetName:(NSString *)target
                    propertyInfo:(NSDictionary *)info
                        animated:(BOOL)animated;


+ (void)presentActionWithTargetName:(NSString *)target
                       propertyInfo:(NSDictionary *)info;

+ (void)presentActionWithTargetCtrl:(id)targetCtrl
                           animated:(BOOL)animated;

+ (void)dismissActionWithComplection:(void (^)())completion;


+ (void)dismissActionAnimated:(BOOL)animated
                onComplection:(void (^)())completion;


+ (void)popActionToController:(NSString *)target;


+ (void)popAnimated:(BOOL)animated;


+ (void)popToRoot:(BOOL)animated;


+ (void)loginActionWithCompletion:(void (^)())completion;


+ (void)logoutActionWithCompletion:(void (^)())completion;


+ (UINavigationController *)currentNavigationController;


@end
