//
//  KTNavigationController.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/10/31.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "MainConfigure.h"


#define navigationCtrlMake(rootVC)\
[[BaseNavigationController alloc]initWithRootViewController:rootVC]

@interface BaseNavigationController : UINavigationController

@end
