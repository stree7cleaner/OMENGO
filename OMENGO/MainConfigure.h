//
//  MainConfigure.h
//  Follows
//
//  Created by liangshangjia on 16/5/11.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//


#ifndef MainConfigure_h
#define MainConfigure_h

#import "MainAppearance.h"
#import "Notification.h"
#import "UIFont+SM_Ext.h"
#import "UIColor+Ext.h"
#import <Masonry.h>
#import <MJExtension.h>
#import "Navigator.h"
#import "Storage.h"
#import "DownSheet.h"
//#import "OMAlertView.h"

//#import "OMSqliteOperation.h"
//#import "SMProgressView.h"
//#import "JPUSHService.h"
#import "UIScrollView+EmptyDataSet.h"
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
#import "UIImage+KTExt.h"
#import "NSString+TimeStamp.h"
#import "OMHUD.h"
#import "UIImageView+KTWeb.h"
//#import <JPush/JPUSHService.h>



/**
 *  自定义NSLog打印(release模式下关闭)
 */
#ifdef DEBUG

    #define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else

    #define NSLog(FORMAT, ...) nil

#endif


#define OMDataKey @"datum"

#define OMProjectDataTable          @"t_addressinfo"
#define OMWaterMeterinfoTable       @"t_waterinfo"
#define OMElectricMeterinfoTable    @"t_electricinfo"
#define OMUploadWaterinfoTable      @"t_uploadwaterinfo"
#define OMUploadElectricinfoTable   @"t_uploadelectricinfo"
#define OMParentId                  @"ParentId"
#define OMDataId                    @"id"
#define OMShowId @"OMShowId" //在水电表页面显示的项目本体ID
#define OMIsExsitProjectDB          @"isExsitProjectDB"


#define WX_APP_ID @"wx2e72e15ae8fd89a0"
#define WX_PAY_MERCHNAT_ID @"1292048701" //微信支付商户号 id


#endif /* MainConfigure_h */
