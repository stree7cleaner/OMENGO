//
//  UIImage+KTExt.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/6.
//  Copyright © 2016年 KT. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIImage+Color.h"
#import "UIImage+Initial.h"


@interface UIImage (KTExt)


//体积压缩 UIImageJPEGRepresentation
- (UIImage *)zipImageToJPGWithRatio:(CGFloat)ratio;


//图片尺寸压缩
- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
