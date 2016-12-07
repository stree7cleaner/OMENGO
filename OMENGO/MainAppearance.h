//
//  MainAppearance.h
//  Follows
//
//  Created by liangshangjia on 16/5/11.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//


#ifndef MainAppearance_h
#define MainAppearance_h

#import "UIView+Extension.h"


#define SMKeyWindow    [[UIApplication sharedApplication].delegate window]

/**
 *  图片相关
 */
#define THUMBNAIL_WIDTH(w)  (1.4f*w)
#define LOGO_NAME           @"宠物"
#define LOGO_IMAGE          [UIImage imageNamed:LOGO_NAME]
#define USER_AVATAR_IMAGE   [UIImage imageNamed:@"icon_user_default"]
#define QIUNIU_DOMAIN       @"http://7xqks8.com2.z0.glb.qiniucdn.com/"    //七牛路径前缀
#define QINIU_IMAGE_URL(imgUrlStr) [NSURL URLWithString:[QIUNIU_DOMAIN stringByAppendingString:imgUrlStr]]


/**
 *  px转换
 */
#define SM_SIZE(px) ((SM_SCREEN_WIDTH/380)*(px)/2.0f) //像素换算


/**
 *  字体
 */
#define SM_CFont(px)    [UIFont customFontOfSize:(px/2.2)]                //自定义字体
#define SM_CBFont(px)   [UIFont customBoldFontOfSize:(px/2.2)]            //自定义粗体
#define SM_SFont(px)    [UIFont systemFontOfSize:(px/2.2)]                //系统字体
#define SM_SBFont(px)   [UIFont boldSystemFontOfSize:(px/2.2)]            //系统粗体


/**
 *  颜色
 */
#define SM_LemonColor       HEXCOLOR(@"f3cc05")     //柠檬
#define SM_waterBlueColor   HEXCOLOR(@"a1e1f3")     //水蓝
#define SM_lightBlueColor   HEXCOLOR(@"03AAF4")     //浅蓝
#define SM_backGroundColor  HEXCOLOR(@"F7F7F7")     //底色
#define SM_lightGrayColor   HEXCOLOR(@"C4C4C4")     //浅灰
#define SM_grayColor        HEXCOLOR(@"787878")     //灰
#define SM_darkGrayColor    HEXCOLOR(@"394d52")     //深灰
#define SM_whiteColor       HEXCOLOR(@"ffffff")     //白
#define SM_blackColor       HEXCOLOR(@"2A2A2A")     //黑
#define SM_orangeColor      HEXCOLOR(@"#FF6701")    //橙色
#define SM_thumeColor       SM_orangeColor          //主色


/**
 *  屏幕尺寸
 */

#define SM_SCREEN_SIZE      [UIScreen mainScreen].bounds.size               //屏宽高结构体
#define SM_SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width         //屏宽
#define SM_SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height        //屏高



#endif /* MainAppearance_h */
