//
//  BaseViewController.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/10/31.
//  Copyright © 2016年 KT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainConfigure.h"
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>
extern NSString * const KTJobNeedRefreshNotificationKey;
extern NSString * const KTJobPeriodicNeedRefreshNotificationKey;
extern NSString * const KTInspectionHistoryNeedRefreshNotificationKey;
extern NSString * const KTOfflineDataNeedRefreshNotificationKey;

@interface BaseViewController : UIViewController


//@property (nonatomic, strong) KTURLSessionTask *task;
//是否是present转场
@property (nonatomic, assign) BOOL isPresented;

- (void)backAction;

@end
