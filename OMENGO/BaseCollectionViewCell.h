//
//  BaseCollectionViewCell.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainConfigure.h"
@interface BaseCollectionViewCell : UICollectionViewCell
/**
 *  cell构造器
 *  @param collectView UICollectionView
 *  @return BaseTableViewCell实例
 */
+ (instancetype)collectCellWithCollectionView:(UICollectionView *)collectView
                                  atIndexPath:(NSIndexPath *)indexPath;


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




@end
