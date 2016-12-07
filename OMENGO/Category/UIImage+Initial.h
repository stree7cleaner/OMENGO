//
//  UIImage+Initial.h
//  ST_Demos
//
//  Created by 梁尚嘉 on 16/4/9.
//  Copyright © 2016年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SMPNGImage(str)     [UIImage pngNamed:str]
#define SMJPGImage(str)     [UIImage jpgNamed:str]
#define SMImage(str,pix)    [UIImage st_imageNamed:str type:pix]
/**
 *  图片构造器(一次性加载，不保存到缓存池)
 */

@interface UIImage (Initial)

/**
 *  自定义png图片的加载
 *  @paramm aName 图片名称
 *  @return UIImage 或 nil
 */
+ (instancetype)pngNamed:(NSString *)aName;


/**
 *  自定义jpg图片的加载
 *  @paramm aName 图片名称
 *  @return UIImage 或 nil
 */
+ (instancetype)jpgNamed:(NSString *)aName;


/**
 *  自定义图片加载
 *  @param aName 图片名称
 *  @param aType 图片类型(png、jpg…… 即图片后缀名)
 *  @return UIImage 或 nil
 */
+ (instancetype)st_imageNamed:(NSString *)aName type:(NSString *)aType;



/**
 *  截取view图像
 *  @param view  UIView
 */
+ (UIImage *) capture:(UIView *)view;

/**
 *  截屏
 */
+ (UIImage *) captureScreen;

+ (UIImage *) captureScreenInRect:(CGRect)rect;

@end
