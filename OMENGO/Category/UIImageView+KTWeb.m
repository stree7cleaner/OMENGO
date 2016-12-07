//
//  UIImageView+KTWeb.m
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/9.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "UIImageView+KTWeb.h"

#import <YYWebImage.h>
#import "UIImage+KTExt.h"

@implementation UIImageView (KTWeb)

//(nullable void (^)(NSProgress * _Nonnull))uploadProgress

- (void)kt_imageWithURLStr:(NSString *)urlStr placeHolder:(UIImage *)placeholder withSize:(CGSize)size
{

    [self kt_imageWithURLStr:urlStr placeHolder:placeholder withSize:size progress:nil onCompletion:nil];
}


- (void)kt_imageWithURLStr:(NSString *)urlStr placeHolder:(UIImage *)placeholder withSize:(CGSize)size progress:(nullable void (^)(CGFloat))progress onCompletion:(KTWebImageViewHandler)completion
{
    [self yy_setImageWithURL:[NSURL URLWithString:urlStr] placeholder:placeholder options:YYWebImageOptionSetImageWithFadeAnimation progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        CGFloat pro = (((CGFloat)receivedSize)/expectedSize);
        NSLog(@"%@",@(pro));
        !progress ?:progress(pro);

    } transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
        if (!size.width) {
            return image;
        }
        if (!size.height) {
            CGFloat height = image.size.height * size.width/image.size.width;
            return [image imageByScalingAndCroppingForSize:CGSizeMake(size.width, height)];
        }
        return [image imageByScalingAndCroppingForSize:size];

    } completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {

        !completion ?: completion(image,stage == YYWebImageStageFinished);

    }];
}
@end
