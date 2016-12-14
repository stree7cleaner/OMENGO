//
//  OMConsumerGoodTableCell.h
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/14.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "BaseTableCell.h"

@protocol OMConsumerGoodTableCellDelegate <NSObject>

- (void)didChangeNumber:(NSUInteger)num atIndexPath:(NSIndexPath *)indexPath;

- (void)didClickPlusButton:(UIButton *)button;

@end

@interface OMConsumerGoodTableCell : BaseTableCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *stockLabel;
@property (nonatomic, assign) NSUInteger num;

@property (nonatomic, weak) id<OMConsumerGoodTableCellDelegate> delegate;

@property (nonatomic, strong) id numberControl;

@end
