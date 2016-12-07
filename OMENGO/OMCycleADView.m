//
//  OMCycleADView.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/6.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMCycleADView.h"
#import "BaseCollectionViewCell.h"
#import "NSTimer+STBlock.h"

@interface  OMCycleADImageData: NSObject
+ (instancetype)imageDataWithImageStr:(NSString *)str;
@property (nonatomic, copy) NSString *imageStr;
@end

@implementation OMCycleADImageData
+ (instancetype)imageDataWithImageStr:(NSString *)str
{
    OMCycleADImageData *data = [OMCycleADImageData new];
    data.imageStr = str;
    return data;
}
- (NSString *)description
{
    return self.imageStr;
}
@end

@interface OMCycleADCollectCell : BaseCollectionViewCell
@property (nonatomic, strong) UIImageView *imageView;

@end
@implementation OMCycleADCollectCell

- (void)configure
{
    [super configure];
    _imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.clipsToBounds = YES;
    [self.contentView addSubview:self.imageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.contentView.bounds;
}

@end


@interface OMCycleADView() <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectView;

@property (nonatomic, strong) NSArray *images;
//是否本地图片
@property (nonatomic, assign) BOOL isLocal;

@property (nonatomic, assign) BOOL canScroll;

@property (nonatomic, assign) NSUInteger currentIndex;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, assign) NSUInteger toIndex;

@end

@implementation OMCycleADView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self configure];
    }
    return self;
}

- (void)configure
{
    [self.collectView registerClass:[OMCycleADCollectCell class]
         forCellWithReuseIdentifier:[OMCycleADCollectCell cellIdentifier]];
    [self addSubview:self.collectView];

}


#pragma mark - Setters
- (void)setImages:(NSArray *)images IsLocal:(BOOL)isLocal
{
    self.isLocal    = isLocal;
    self.images     = images;
    self.canScroll  = self.images.count > 1;

    if (self.timer) {
        [self.timer invalidate];
    }
    if (!self.images.count) {
        NSLog(@"banner的图片集合不能为空");
        return;
    }
    if (self.canScroll) {
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.images.count + 2];
        NSString *firstImage = [self.images firstObject];
        NSString *lastImage = [self.images lastObject];
        [array addObject:[OMCycleADImageData imageDataWithImageStr:lastImage]];
        for (NSString *imageStr in self.images) {
            [array addObject:[OMCycleADImageData imageDataWithImageStr:imageStr]];
        }
        [array addObject:[OMCycleADImageData imageDataWithImageStr:firstImage]];
        self.images = array;

        [self scrollToFirstWithAnimated:NO];
        [self.collectView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
        self.currentIndex = 1;

        _toIndex = 1;

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @weakify(self);
            _timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES withCallBack:^{
                @strongify(self);
                [self doTransitionPage];
            }];
        });
    }




}

- (void)doTransitionPage
{
//    NSUInteger numberToCount = self.images.count - 2;
    NSUInteger minIndex = 2;
    NSUInteger maxIndex = self.images.count - 1;

    _toIndex ++;
    if (_toIndex >  maxIndex) {
        _toIndex = minIndex;
    }else if (_toIndex < minIndex) {
        _toIndex = maxIndex;
    }

    if (self.currentIndex > self.images.count - 1) {
        self.currentIndex = 1;
    }else if (self.currentIndex < 1) {
        self.currentIndex = self.images.count - 2;
    }

//    NSLog(@"%ld",_toIndex);
    [self.collectView selectItemAtIndexPath:[NSIndexPath indexPathForItem:_toIndex inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}


- (void)setCanScroll:(BOOL)canScroll
{
    _canScroll = canScroll;
    self.collectView.scrollEnabled = canScroll;
}

- (void)setCurrentIndex:(NSUInteger)currentIndex
{
    _currentIndex = currentIndex;
    NSUInteger selectedIndex = 0;
    if (currentIndex >= self.images.count - 1) {
        selectedIndex = 0;
    }else if (currentIndex <= 0) {
        selectedIndex = self.images.count - 3;
    }else {
        selectedIndex = currentIndex - 1;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(CycleADView:didScrollToIndex:)]) {
        [self.delegate CycleADView:self didScrollToIndex:self.canScroll ? currentIndex : 0];
    }
//    NSLog(@"%ld",selectedIndex);
}

#pragma mark - Getters
- (UICollectionView *)collectView
{
    if (!_collectView) {
        _collectView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:[self layout]];
        _collectView.delegate       = self;
        _collectView.dataSource     = self;
        _collectView.pagingEnabled  = YES;
        _collectView.showsHorizontalScrollIndicator = NO;
    }
    return _collectView;
}

- (UICollectionViewLayout*)layout
{
    ///设置collectionView的布局
    UICollectionViewFlowLayout *flowLayout  = [[UICollectionViewFlowLayout alloc]init];
    //列距
    flowLayout.minimumInteritemSpacing      = DBL_EPSILON;
    //行距
    flowLayout.minimumLineSpacing           = DBL_EPSILON;
    //item大小
    flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return flowLayout;
}

#pragma mark - Actions
- (void)scrollToFirstWithAnimated:(BOOL)animated
{
    if (!self.canScroll) {
        return;
    }
    [self.collectView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:animated];
}

- (void)scrollToLastWithAnimated:(BOOL)animated
{
    if (!self.canScroll) {
        return;
    }
    [self.collectView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.images.count - 2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:animated];
}

#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    OMCycleADCollectCell *cell  = [OMCycleADCollectCell collectCellWithCollectionView:collectionView atIndexPath:indexPath];
    NSString *imageStr          = [self.images[indexPath.item] imageStr];
    if (_isLocal) {
        cell.imageView.image    = SMImage((imageStr?imageStr:@""), @"");
    }else {
        [cell.imageView kt_imageWithURLStr:imageStr placeHolder:nil withSize:self.frame.size];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger selectedIndex = 0;
    if (indexPath.item > self.images.count - 2) {
        selectedIndex = 0;
    }else if (indexPath.item < 1) {
        selectedIndex = self.images.count - 2;
    }else {
        selectedIndex = indexPath.item - 1;
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(CycleADView:didSelectIndex:)]) {

        [self.delegate CycleADView:self didSelectIndex:self.canScroll ? selectedIndex : 0];

    }


}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger index = round(scrollView.contentOffset.x/scrollView.size.width);
    //    if (!isDragging) {
    if (index == 0) {
        if (scrollView.contentOffset.x < 30 && scrollView.contentOffset.x >= 0) [self scrollToLastWithAnimated:NO];
    }else if (index == self.images.count - 1) {
        if (scrollView.contentOffset.x > scrollView.size.width * (self.images.count -1) - 20 ) [self scrollToFirstWithAnimated:NO];
    }
    self.currentIndex = index;

}

static BOOL isDragging;
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    isDragging = YES;
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    isDragging = NO;
    @weakify(self);
    _toIndex = self.currentIndex + 1;
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 repeats:YES withCallBack:^{
        @strongify(self);
        [self doTransitionPage];
    }];

}

- (void)dealloc
{
    [self.timer invalidate];
}

@end
