//
//  KTLemonPaymentViewController.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/12/12.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseTableViewController.h"

/**
 *  订单支付页面
 */
//#import "KTOrder.h"
@interface KTLemonPaymentViewController : BaseTableViewController
@property (nonatomic, strong) id order;
@property (nonatomic, assign) BOOL isRepay;
@end
