//
//  OMCycleADView.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import <UIKit/UIKit.h>
@class OMCycleADView;
@protocol OMCycleADViewDelegate <NSObject>

- (void)CycleADView:(OMCycleADView *)view didSelectIndex:(NSUInteger)index;

- (void)CycleADView:(OMCycleADView *)view didScrollToIndex:(NSUInteger)index;

@end


@interface OMCycleADView : UIView

@property (nonatomic, weak) id<OMCycleADViewDelegate> delegate;

- (void)setImages:(NSArray *)images
          IsLocal:(BOOL)isLocal;

@end

