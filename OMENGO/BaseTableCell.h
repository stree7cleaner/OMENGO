//
//  BaseTableCell.h
//  Follows
//
//  Created by liangshangjia on 16/5/11.
//  Copyright © 2016年 SAMI-Network-Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainConfigure.h"

@interface BaseTableCell : UITableViewCell

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, assign) BOOL canHighLight;
/**
 *  cell构造器
 *  @param aTableView UITableView
 *  @return BaseTableViewCell实例
 */
+ (instancetype)tableViewCellWithTableView:(UITableView *)aTableView;


/**
 *  初始化方法
 */
- (void)configure NS_REQUIRES_SUPER;



/**
 *  模型设置cell
 *  @param obj 模型
 */
- (void)configureCellWithObj:(id)obj;


/**
 *  cell的重用识别码
 *  @return 识别码
 */
+ (NSString *)cellIdentifier;



/**
 *  cell高度固定
 */
+ (CGFloat)cellHeight;


@end
