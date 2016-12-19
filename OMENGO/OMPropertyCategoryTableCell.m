//
//  OMPropertyCategoryTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/15.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMPropertyCategoryTableCell.h"
#import "OMPropertyCategoryCollectCell.h"
#import "OMPageControl.h"
@interface OMPropertyCategoryTableCell() <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectView;
@property (nonatomic, strong) OMPageControl *pageControl;
@property (nonatomic, strong) NSArray *items;
@end

@implementation OMPropertyCategoryTableCell

- (void)configure
{
    [super configure];
    _items = @[
                       @{@"name":@"物业公告",@"image":@"ic_category_notice",@"controller":@"OMAnnoucementListViewController"},
                       @{@"name":@"费用查缴",@"image":@"ic_category_trackDown",@"controller":@"OMTrackDownViewController"},
                       @{@"name":@"公共保修",@"image":@"ic_category_guarantee",@"controller":@""},
                       @{@"name":@"投诉表扬",@"image":@"ic_category_publish",@"controller":@""},
                       ];

    [self.collectView registerClass:[OMPropertyCategoryCollectCell class]
         forCellWithReuseIdentifier:[OMPropertyCategoryCollectCell cellIdentifier]];

    [self.contentView addSubview:self.collectView];
    [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];

}

#pragma mark - Getters

- (UICollectionView *)collectView
{
    if (!_collectView) {
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectZero
                                         collectionViewLayout:[self layout]];
        _collectView.delegate = self;
        _collectView.dataSource = self;
        _collectView.backgroundColor = SM_whiteColor;
        _collectView.pagingEnabled = YES;
    }
    return _collectView;
}

- (UICollectionViewLayout*)layout
{
    ///设置collectionView的布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    //列距
    flowLayout.minimumInteritemSpacing = 0;
    //行距
    flowLayout.minimumLineSpacing = 0;
    //item大小
    float itemSize = OMPropertyCategoryCollectCell_size;
    flowLayout.itemSize = CGSizeMake(itemSize, itemSize*1.1);

    return flowLayout;
}

#pragma mark - collect view delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OMPropertyCategoryCollectCell *cell = [OMPropertyCategoryCollectCell collectCellWithCollectionView:collectionView atIndexPath:indexPath];
    NSString *imageStr = self.items[indexPath.item][@"image"];
    cell.imageView.image = imageStr.length?[UIImage imageNamed:imageStr]:[UIImage imageWithColor:SM_whiteColor];
    cell.label.text = self.items[indexPath.item][@"name"];

    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ctrlStr = self.items[indexPath.item][@"controller"];
    if (ctrlStr.length) {
        NaviPush(ctrlStr, (@{@"title":self.items[indexPath.item][@"name"]}));
    }
}

+ (CGFloat)cellHeight
{
    return OMPropertyCategoryCollectCell_size*1.1;
}

@end
