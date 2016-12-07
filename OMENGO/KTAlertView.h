//
//  KTAlertView.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/11/15.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseView.h"
typedef void (^KTAlertViewBlock) (NSUInteger indexOfButton);

@interface KTAlertView : UIView
+ (KTAlertView *)alertWithMessage:(NSString *)msg Title:(NSString *)title ButtonTitles:(NSArray *)buttonTitles withClickBlock:(KTAlertViewBlock)block;
@end
