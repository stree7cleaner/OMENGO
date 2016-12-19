//
//  OMTrackdownStatusSectionHeader.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/16.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OMTrackdownStatusSectionHeaderDelegate <NSObject>

- (void)didSelectHeaderViewAtSection:(NSUInteger)section isOpen:(BOOL)open;

@end

@interface OMTrackdownStatusSectionHeader : UITableViewHeaderFooterView
@property (nonatomic, assign) BOOL isAllPaid;
@property (nonatomic, copy) NSString *element;
@property (nonatomic, assign) BOOL isOpen;
@property (nonatomic, assign) NSUInteger section;

@property (nonatomic, weak) id<OMTrackdownStatusSectionHeaderDelegate> delegate;

+ (NSString *)identifier;
@end
