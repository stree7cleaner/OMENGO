//
//  KTPaySelectionTableCell.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/12/12.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseTableCell.h"

@interface KTPaySelectionTableCell : BaseTableCell
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIView *separatorLine;
@property (nonatomic, strong) UIImageView *selectionView;

@property (nonatomic, assign, getter=isChosen) BOOL chosen;
@end
