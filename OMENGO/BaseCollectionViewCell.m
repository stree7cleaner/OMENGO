//
//  BaseCollectionViewCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@implementation BaseCollectionViewCell
/**
 *  cell构造器
 *  @param collectView UICollectionView
 *  @return BaseTableViewCell实例
 */
+ (instancetype)collectCellWithCollectionView:(UICollectionView *)collectView
                                  atIndexPath:(NSIndexPath *)indexPath
{
    BaseCollectionViewCell *cell = [collectView dequeueReusableCellWithReuseIdentifier:[self cellIdentifier] forIndexPath:indexPath];
    return cell;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self configure];
    }
    return self;
}


/**
 *  初始化方法
 */
- (void)configure NS_REQUIRES_SUPER
{

}



/**
 *  模型设置cell
 *  @param obj 模型
 */
- (void)configureCellWithObj:(id)obj
{

}


/**
 *  cell的重用识别码
 *  @return 识别码
 */
+ (NSString *)cellIdentifier
{
    return  NSStringFromClass([self class]);
}


- (void)dealloc
{
    NSLog(@"%@__dealloc",NSStringFromClass(self.class));
}


@end
