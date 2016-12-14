//
//  OMMallCategoryTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/9.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMMallCategoryTableCell.h"
#import "OMMallCategoryCollectCell.h"
#import "OMPageControl.h"
@interface OMMallCategoryTableCell () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectView;
@property (nonatomic, strong) OMPageControl *pageControl;
@property (nonatomic, strong) NSArray *items;
@end

@implementation OMMallCategoryTableCell

- (void)configure
{
    [super configure];
    NSArray *array = @[
               @{@"name":@"日常清洁",@"image":@"ic_dailyClear",@"controller":@""},
               @{@"name":@"维修服务",@"image":@"01-weixiufuwu",@"controller":@""},
               @{@"name":@"家电清洁",@"image":@"01-dianqiqingjie",@"controller":@""},
               @{@"name":@"开荒清洁",@"image":@"05-dasaochu",@"controller":@""},
               @{@"name":@"洗衣服务",@"image":@"01-xiyi",@"controller":@""},
               @{@"name":@"送水服务",@"image":@"ic_waterService",@"controller":@""},
               @{@"name":@"百货到家",@"image":@"01-baihuo",@"controller":@"OMConsumerGoodsViewController"},
               @{@"name":@"大扫除",@"image":@"01-shendu",@"controller":@""},
               @{@"name":@"装修服务",@"image":@"05-kaihuang",@"controller":@""},
               @{@"name":@"老人产品",@"image":@"08-yanglao",@"controller":@""},

               @{@"name":@"搬家服务",@"image":@"08-banjia",@"controller":@""},
               @{@"name":@"开锁服务",@"image":@"08-kaisuo",@"controller":@""},
               @{@"name":@"",@"image":@"",@"controller":@""},
               @{@"name":@"",@"image":@"",@"controller":@""},
               @{@"name":@"",@"image":@"",@"controller":@""},
               @{@"name":@"",@"image":@"",@"controller":@""},
               @{@"name":@"",@"image":@"",@"controller":@""},
               @{@"name":@"",@"image":@"",@"controller":@""},
               @{@"name":@"",@"image":@"",@"controller":@""},
               @{@"name":@"",@"image":@"",@"controller":@""},
               ];

    NSMutableArray *items = [NSMutableArray arrayWithCapacity:array.count];

    NSUInteger numOfRow = 2; //一页所包含的行数
    NSUInteger numOfColumn = 5; //一页所包含的列表
    NSUInteger numOfItemAtOnePage = 10; //一页所有的元素个数

    for (NSUInteger i = 0; i < array.count; i ++) {
        NSUInteger index = ((i%numOfItemAtOnePage)/numOfRow) + numOfItemAtOnePage*(i/numOfItemAtOnePage) + (i%numOfRow == 0 ? 0 : numOfColumn);
        id obj = array[index];
        [items addObject:obj];
    }
    _items = items;


    [self.collectView registerClass:[OMMallCategoryCollectCell class]
         forCellWithReuseIdentifier:[OMMallCategoryCollectCell cellIdentifier]];

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
    float itemSize = OMMallCategoryCollectCell_size;
    flowLayout.itemSize = CGSizeMake(itemSize, itemSize*1.2);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    return flowLayout;
}

#pragma mark - collect view delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OMMallCategoryCollectCell *cell = [OMMallCategoryCollectCell collectCellWithCollectionView:collectionView atIndexPath:indexPath];
    NSString *imageStr = self.items[indexPath.item][@"image"];
    cell.imageView.image = imageStr.length?[UIImage imageNamed:imageStr]:[UIImage imageWithColor:SM_whiteColor];
    cell.label.text = self.items[indexPath.item][@"name"];

    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ctrlStr = self.items[indexPath.item][@"controller"];
    if (ctrlStr) {
        NaviPush(@"OMConsumerGoodsViewController", (@{@"title":@"百货到家"}));
    }
}

+ (CGFloat)cellHeight
{
    return OMMallCategoryCollectCell_size*2*1.2;
}

@end
