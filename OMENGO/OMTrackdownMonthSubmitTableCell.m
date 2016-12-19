//
//  OMTrackdownMonthSubmitTableCell.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/16.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMTrackdownMonthSubmitTableCell.h"
#import "BaseCollectionViewCell.h"
#import "OMTrackdownMonthStatus.h"
@interface OMTrackdownMonthSubmitTableCell () <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectView;
@property (nonatomic, strong) NSArray <OMTrackdownMonthStatus *>*status;
@end

#define kOMTrackdownMonthSubmitCollectCell_delta SM_SIZE(20)
#define kOMTrackdownMonthSubmitCollectCell_itemNum_vertical 3
#define kOMTrackdownMonthSubmitCollectCell_width ((SM_SCREEN_WIDTH - kOMTrackdownMonthSubmitCollectCell_delta*(kOMTrackdownMonthSubmitCollectCell_itemNum_vertical+1))/kOMTrackdownMonthSubmitCollectCell_itemNum_vertical)
#define kOMTrackdownMonthSubmitCollectCell_height (kOMTrackdownMonthSubmitCollectCell_width*.6)

@interface OMTrackdownMonthSubmitCollectCell : BaseCollectionViewCell
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, assign) BOOL om_selected;

@end

@implementation OMTrackdownMonthSubmitCollectCell

- (void)configure
{
    [super configure];

    [self setupConstraints];


    self.contentView.layer.borderWidth  = 1.f;
    self.contentView.layer.borderColor  = SM_lightGrayColor.CGColor;
    self.contentView.layer.cornerRadius = SM_SIZE(10);
    self.contentView.clipsToBounds      = YES;
}

- (void)setupConstraints
{
    UIView *containView = [UIView new];
    [self.contentView addSubview:containView];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.centerX.equalTo(self.contentView.mas_centerX);
    }];

    [containView addSubview:self.timeLabel];
    [containView addSubview:self.priceLabel];

    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@(SM_SIZE(0)));
    }];

    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.timeLabel.mas_centerX);
        make.top.equalTo(self.timeLabel.mas_bottom).offset(SM_SIZE(15));
        make.bottom.equalTo(@0);
    }];
    
}

- (void)setOm_selected:(BOOL)om_selected
{
    _om_selected = om_selected;
    self.contentView.layer.borderColor = (_om_selected ? SM_thumeColor : SM_lightGrayColor).CGColor;

    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue = @(1.0f);
    animation.toValue = @(.95f);
    animation.autoreverses = YES;
    animation.duration = .1f;
    [self.contentView.layer addAnimation:animation forKey:nil];

}


#pragma mark - Getters
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.textColor = SM_darkGrayColor;
        _timeLabel.font = SM_CFont(34);
    }
    return _timeLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = SM_CFont(32);
        _priceLabel.textColor = SM_lightGrayColor;
    }
    return _priceLabel;
}

@end



@implementation OMTrackdownMonthSubmitTableCell

- (void)configure
{
    [super configure];
    [self.contentView addSubview:self.collectView];
    [self.collectView registerClass:[OMTrackdownMonthSubmitCollectCell class]
         forCellWithReuseIdentifier:[OMTrackdownMonthSubmitCollectCell cellIdentifier]];


}

- (void)configureCellWithObj:(id)obj
{
    _status = [OMTrackdownMonthStatus fakeData];
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.status.count];
    for (OMTrackdownMonthStatus *status in self.status) {
        if (![status isAllPaid]) {
            [array addObject:status];
        }
    }
    _status = array;
    [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(0));
        make.left.right.equalTo(@0);
        make.height.equalTo(@(kOMTrackdownMonthSubmitCollectCell_delta*2+(self.status.count/3)*(kOMTrackdownMonthSubmitCollectCell_delta+kOMTrackdownMonthSubmitCollectCell_height)+(self.status.count%kOMTrackdownMonthSubmitCollectCell_itemNum_vertical? kOMTrackdownMonthSubmitCollectCell_height:0)));
    }];
    [self.collectView reloadData];
}

#pragma mark - Getters
- (UICollectionView *)collectView
{
    if (!_collectView) {
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectZero
                                         collectionViewLayout:[self layout]];
        _collectView.delegate           = self;
        _collectView.dataSource         = self;
        _collectView.backgroundColor    = SM_whiteColor;
        _collectView.pagingEnabled      = YES;
    }
    return _collectView;
}

- (UICollectionViewLayout*)layout
{
    ///设置collectionView的布局
    UICollectionViewFlowLayout *flowLayout  = [[UICollectionViewFlowLayout alloc]init];
    //列距
    flowLayout.minimumInteritemSpacing      = kOMTrackdownMonthSubmitCollectCell_delta;
    //行距
    flowLayout.minimumLineSpacing           = kOMTrackdownMonthSubmitCollectCell_delta;
    //item大小
    float itemSize      = kOMTrackdownMonthSubmitCollectCell_width;
    flowLayout.itemSize = CGSizeMake(itemSize, kOMTrackdownMonthSubmitCollectCell_height);

    flowLayout.sectionInset = UIEdgeInsetsMake(2*kOMTrackdownMonthSubmitCollectCell_delta, kOMTrackdownMonthSubmitCollectCell_delta, 2*kOMTrackdownMonthSubmitCollectCell_delta, kOMTrackdownMonthSubmitCollectCell_delta);

    return flowLayout;
}

#pragma mark - collectionView delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.status.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OMTrackdownMonthSubmitCollectCell *cell = [OMTrackdownMonthSubmitCollectCell collectCellWithCollectionView:collectionView atIndexPath:indexPath];
    cell.timeLabel.text = [self.status[indexPath.item] time];
    cell.priceLabel.text = [@"￥" stringByAppendingString:[self.status[indexPath.item] allPriceNeedToPay]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    OMTrackdownMonthSubmitCollectCell *cell = (id)[collectionView cellForItemAtIndexPath:indexPath];
    cell.om_selected = !cell.om_selected;
}

+ (CGFloat)cellHeightWithObject:(id)obj
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[OMTrackdownMonthStatus fakeData].count];
    for (OMTrackdownMonthStatus *status in [OMTrackdownMonthStatus fakeData]) {
        if (![status isAllPaid]) {
            [array addObject:status];
        }
    }
    NSArray <OMTrackdownMonthStatus*>*status = array;
    CGFloat height =  kOMTrackdownMonthSubmitCollectCell_delta*2+(status.count/3)*(kOMTrackdownMonthSubmitCollectCell_delta+kOMTrackdownMonthSubmitCollectCell_height)+(status.count%kOMTrackdownMonthSubmitCollectCell_itemNum_vertical? kOMTrackdownMonthSubmitCollectCell_height: -kOMTrackdownMonthSubmitCollectCell_delta);
    height += 2*kOMTrackdownMonthSubmitCollectCell_delta;
    return height;
}
@end
