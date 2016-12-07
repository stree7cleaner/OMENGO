//
//  DownSheet.h
//  audioWriting
//
//  Created by wolf on 14-7-19.
//  Copyright (c) 2014年 wangruiyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownSheetCell.h"
@class DownSheet;

@protocol DownSheetDelegate <NSObject>
@optional
-(void)downSheet:(DownSheet *)downSheet didSelectIndex:(NSInteger)index;
@end

@interface DownSheet : UIView<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>{
    UITableView *view;
    NSArray *listData;
}
-(id)initWithlist:(NSArray *)list height:(CGFloat)height;
- (void)showInView:(id)Sview;
@property(nonatomic,assign) id <DownSheetDelegate> delegate;
@property (nonatomic, strong) void (^onSelectAction)(NSInteger index);
@property (nonatomic, strong) void (^onCancelAction)();
@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
