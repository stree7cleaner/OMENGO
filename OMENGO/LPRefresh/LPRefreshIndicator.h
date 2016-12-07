//
//  LPRefreshIndicator.h
//  LPRefresh
//
//  Created by FineexMac on 16/1/6.
//  Copyright © 2016年 LPiOS. All rights reserved.
//
//  作者GitHub主页 https://github.com/SwiftLiu
//  作者邮箱 1062014109@qq.com
//  下载链接 https://github.com/SwiftLiu/LPRefresh.git

#import <UIKit/UIkit.h>

@interface LPRefreshIndicator : UIView

@property (nonatomic, assign) BOOL refreshing;
@property (nonatomic, assign) BOOL isDragging;



///下拉进度
@property (assign, nonatomic) CGFloat pullProgress;


///刷新执行
@property (copy, nonatomic) void (^refreshBlock)();

///刷新结果
- (void)refreshSuccess:(BOOL)isSuccess;

@end
