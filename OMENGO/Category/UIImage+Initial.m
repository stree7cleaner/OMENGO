//
//  UIImage+Initial.m
//  ST_Demos
//
//  Created by 梁尚嘉 on 16/4/9.
//  Copyright © 2016年 ST. All rights reserved.
//

#import "UIImage+Initial.h"
#define KeyWindow [UIApplication sharedApplication].keyWindow
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation UIImage (Initial)

+ (instancetype)pngNamed:(NSString *)aName
{
    return [self st_imageNamed:[aName stringByAppendingString:[self suffixName]] type:@"png"];
}

+ (instancetype)jpgNamed:(NSString *)aName
{
    return [self st_imageNamed:aName type:@"jpg"];
}

+ (instancetype)st_imageNamed:(NSString *)aName type:(NSString *)aType
{
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:aName ofType:aType];
    return [UIImage imageWithContentsOfFile:imagePath];
}

+ (NSString *)suffixName
{
    switch ((int)[UIScreen mainScreen].nativeScale) {
        case 1:
            return @"";
            break;
            
        case 2:
            return @"@2x";
            break;
            
        case 3:
            return @"@3x";
            break;
            
        default:
            break;
    }
    return  @"";
}



+ (UIImage *) capture:(UIView *)view {
    CGRect rect = [view bounds];
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

+ (UIImage *) captureScreen
{
    return [self capture:KeyWindow];
}


+ (UIImage *)captureScreenInRect:(CGRect)rect
{



    BOOL ignoreOrientation = SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0");

    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;

    CGSize imageSize = CGSizeZero;
    CGFloat width = rect.size.width, height = rect.size.height;
    CGFloat x = rect.origin.x, y = rect.origin.y;

    //    imageSize = CGSizeMake(width, height);
    //    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    if (UIInterfaceOrientationIsPortrait(orientation) || ignoreOrientation)
    {
        //imageSize = [UIScreen mainScreen].bounds.size;
        imageSize = CGSizeMake(width, height);
        x = rect.origin.x, y = rect.origin.y;
    }
    else
    {
        //imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
        imageSize = CGSizeMake(height, width);
        x = rect.origin.y, y = rect.origin.x;
    }

    UIGraphicsBeginImageContextWithOptions(imageSize, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, KeyWindow.center.x, KeyWindow.center.y);
    CGContextConcatCTM(context, KeyWindow.transform);
    CGContextTranslateCTM(context, -KeyWindow.bounds.size.width * KeyWindow.layer.anchorPoint.x, -KeyWindow.bounds.size.height * KeyWindow.layer.anchorPoint.y);

    // Correct for the screen orientation
    if(!ignoreOrientation)
    {
        if(orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, (CGFloat)M_PI_2);
            CGContextTranslateCTM(context, 0, -KeyWindow.bounds.size.height);
            CGContextTranslateCTM(context, -x, y);
        }
        else if(orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, (CGFloat)-M_PI_2);
            CGContextTranslateCTM(context, -KeyWindow.bounds.size.width, 0);
            CGContextTranslateCTM(context, x, -y);
        }
        else if(orientation == UIInterfaceOrientationPortraitUpsideDown)
        {
            CGContextRotateCTM(context, (CGFloat)M_PI);
            CGContextTranslateCTM(context, -KeyWindow.bounds.size.height, -KeyWindow.bounds.size.width);
            CGContextTranslateCTM(context, x, y);
        }
        else
        {
            CGContextTranslateCTM(context, -x, -y);
        }
    }
    else
    {
        CGContextTranslateCTM(context, -x, -y);
    }

    //[KeyWindow layoutIfNeeded];

    if([KeyWindow respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        [KeyWindow drawViewHierarchyInRect:KeyWindow.bounds afterScreenUpdates:NO];
    else
        [KeyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];

    CGContextRestoreGState(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end
