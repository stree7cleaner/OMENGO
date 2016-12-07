//
//  UIImageView+KTWeb.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/9.
//  Copyright © 2016年 KT. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^KTWebImageViewHandler) ( UIImage * _Nullable image,BOOL isSuccess);

@interface UIImageView (KTWeb)


- (void)kt_imageWithURLStr:(NSString * _Nullable)urlStr placeHolder:(UIImage *_Nullable)placeholder withSize:(CGSize)size;

- (void)kt_imageWithURLStr:(NSString *_Nullable)urlStr placeHolder:(UIImage *_Nullable)placeholder withSize:(CGSize)size progress:(nullable void (^)(CGFloat))progress onCompletion:(KTWebImageViewHandler _Nullable)completion;



@end
