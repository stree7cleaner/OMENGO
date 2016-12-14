//
//  OMConsumerGoodsViewController.m
//  OMENGO
//
//  Created by 梁尚嘉 on 2016/12/14.
//  Copyright © 2016年 Kamfat. All rights reserved.
//

#import "OMConsumerGoodsViewController.h"
#import "BaseTableView.h"
#import "BaseCollectionViewCell.h"
#import "OMConsumerGoodTableCell.h"

#define kSectionHeight SM_SIZE(60)
#define kRedColor HEXCOLOR(@"#F6392E")
#define kCellHeight [OMConsumerGoodTableCell cellHeight]
@interface OMConsumerGoodsViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate,OMConsumerGoodTableCellDelegate>

@property (nonatomic, strong) UIButton *confirmButton;
@property (nonatomic, strong) UILabel *prizeLabel;
@property (nonatomic, strong) UIButton *shopCartButton;
@property (nonatomic, strong) UIButton *badgeView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectView;

@property (nonatomic, strong) NSArray *categorys;

//第个单元添加数量
@property (nonatomic, strong) NSMutableDictionary *numberDictionary;

//分区添加数量
@property (nonatomic, strong) NSMutableDictionary *sectionNumDictionary;

//分区Y偏移量数组
@property (nonatomic, strong) NSArray *sectionOffsets;

@property (nonatomic, assign) NSUInteger selectedSection;
@end


@interface KTConsumerGoodCategoryCollectCell : BaseCollectionViewCell
{
    UIButton *_badgeView;
}
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *selectBackground;
@property (nonatomic, strong) UIView *line;
@property (nonatomic, assign) BOOL kt_selected;

- (void)setBadge:(NSUInteger)number;

@end
@implementation KTConsumerGoodCategoryCollectCell


- (void)setBadge:(NSUInteger)number
{
    _badgeView.hidden = !number;
    [_badgeView setTitle:[@(number)stringValue] forState:UIControlStateNormal];
}


- (void)configure
{
    [super configure];

    [self.contentView addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@.5f);
    }];

    [self.contentView addSubview:self.selectBackground];
    [self.selectBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];

    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];

    _badgeView = [UIButton new];
    _badgeView.backgroundColor = kRedColor;
    _badgeView.titleLabel.font = SM_CFont(23);
    [_badgeView setTitleColor:SM_whiteColor forState:UIControlStateNormal];
    //    [_badgeView setTitle:@"999" forState:UIControlStateNormal];
    _badgeView.layer.cornerRadius = SM_SIZE(25)/2;
    _badgeView.clipsToBounds = YES;
    _badgeView.contentEdgeInsets = UIEdgeInsetsMake(SM_SIZE(5), SM_SIZE(5), SM_SIZE(5), SM_SIZE(5));
    [self.contentView addSubview:_badgeView];
    [_badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(SM_SIZE(-15)));
        make.bottom.equalTo(self.titleLabel.mas_top);
        make.width.mas_greaterThanOrEqualTo(SM_SIZE(25));
        make.height.equalTo(@(SM_SIZE(25)));
    }];


}

- (void)setKt_selected:(BOOL)kt_selected
{
    _kt_selected = kt_selected;
    self.selectBackground.hidden = !_kt_selected;
    self.titleLabel.highlighted = _kt_selected;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = SM_CFont(29);
        _titleLabel.textColor = SM_darkGrayColor;
        _titleLabel.highlightedTextColor = SM_darkGrayColor;
    }
    return _titleLabel;
}

- (UIView *)line
{
    if (!_line) {
        _line = [UIView new];
        _line.backgroundColor = SM_whiteColor;
    }
    return _line;
}

- (UIView *)selectBackground
{
    if (!_selectBackground) {
        _selectBackground = [UIView new];
        _selectBackground.backgroundColor = SM_whiteColor;
        _selectBackground.hidden = YES;

        UIView *bar = [UIView new];
        bar.backgroundColor = SM_thumeColor;
        [_selectBackground addSubview:bar];
        [bar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@0);
            make.top.equalTo(@(SM_SIZE(30)));
            make.bottom.equalTo(@(SM_SIZE(-30)));
            make.width.equalTo(@(SM_SIZE(10)));
        }];
    }
    return _selectBackground;
}

@end


@implementation OMConsumerGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _categorys =  @[
                    @{@"粮油副食":
                          @[
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加900ml",
                                  @"price":@"￥77.88",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jiangyou.png",
                                  @"title":@"厨邦酱油500ml",
                                  @"price":@"￥31.92",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_lajiao.png",
                                  @"title":@"味好美辣椒粉100ml",
                                  @"price":@"￥12.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinnlongyi2.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              ]},
                    @{@"家庭杂用":
                          @[
                              @{
                                  @"icon":@"ic_jiangyou.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"厨邦酱油1000ml",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_lajiao.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              ]},
                    @{@"女士用品":
                          @[
                              @{
                                  @"icon":@"ic_jiangyou.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"厨邦酱油1000ml",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_lajiao.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              ]},
                    @{@"零食":
                          @[
                              @{
                                  @"icon":@"ic_jiangyou.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"厨邦酱油1000ml",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_lajiao.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              ]},
                    @{@"饮料/水":
                          @[
                              @{
                                  @"icon":@"ic_jiangyou.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"厨邦酱油1000ml",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_lajiao.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              ]},
                    @{@"烟酒":
                          @[
                              @{
                                  @"icon":@"ic_jiangyou.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"厨邦酱油1000ml",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_lajiao.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              @{
                                  @"icon":@"ic_jinlongyu.png",
                                  @"title":@"金龙鱼花生油调和油绿色无添加2L",
                                  @"price":@"￥100.50",
                                  @"stock":@"100",
                                  },
                              ]},
                    ];

    NSMutableArray *sectionOffsets = [NSMutableArray array];
    CGPoint offset = CGPointZero;
    for (NSDictionary *categoryDic in self.categorys) {
        [sectionOffsets addObject: [NSValue valueWithCGPoint:offset]];
        offset.y += kSectionHeight;
        if (categoryDic.allValues.count) {
            offset.y += [categoryDic.allValues[0] count]*kCellHeight;
        }
    }
    self.sectionOffsets = sectionOffsets;

    self.numberDictionary = [NSMutableDictionary dictionary];
    self.sectionNumDictionary = [NSMutableDictionary dictionary];

    [self.collectView registerClass:[KTConsumerGoodCategoryCollectCell class] forCellWithReuseIdentifier:[KTConsumerGoodCategoryCollectCell cellIdentifier]];
    [self.view addSubview:self.collectView];

    self.tableView.rowHeight = [OMConsumerGoodTableCell cellHeight];
    self.tableView.sectionHeaderHeight = SM_SIZE(60);
    [self.view addSubview:self.tableView];

    [self.collectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.width.equalTo(@((SM_SCREEN_WIDTH*2.f)/9.f));
        make.bottom.equalTo(self.tableView.mas_bottom);
    }];

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.collectView.mas_right);
        make.top.right.equalTo(@0);
    }];

    UIView *bottomBar = [UIView new];
    bottomBar.backgroundColor = SM_whiteColor;
    [self.view addSubview:bottomBar];
    [bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(@0);
        make.top.equalTo(self.tableView.mas_bottom);
        make.height.equalTo(@(49));
    }];


    [bottomBar addSubview:self.prizeLabel];
    [bottomBar addSubview:self.confirmButton];
    [self.view addSubview:self.shopCartButton];
    UIView *line = [UIView new];
    line.backgroundColor = HEXCOLOR(@"F7F7F7");
    [bottomBar addSubview:line];

    [self.shopCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomBar.mas_left).offset(SM_SIZE(40));
        make.centerY.equalTo(bottomBar.mas_top).offset(SM_SIZE(25));
    }];

    [self.prizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(@0);
        make.top.equalTo(@1);
        make.width.equalTo(@(SM_SCREEN_WIDTH/3.f*2));
    }];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(@0);
        make.top.equalTo(@1);
        make.left.equalTo(self.prizeLabel.mas_right);
    }];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@.8);
    }];

    [self.view addSubview:self.badgeView];
    [_badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.shopCartButton.mas_right).offset(SM_SIZE(-15));
        make.centerY.equalTo(self.shopCartButton.mas_top).offset(SM_SIZE(20));
        make.width.mas_greaterThanOrEqualTo(SM_SIZE(32));
        make.height.equalTo(@(SM_SIZE(32)));
    }];

    [self setBadge:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Getters
- (UICollectionView *)collectView
{
    if (!_collectView) {
        _collectView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SM_SCREEN_WIDTH/4, SM_SCREEN_HEIGHT-64) collectionViewLayout:[self layout]];
        //设置代理
        _collectView.dataSource = self;
        _collectView.delegate = self;
        _collectView.scrollEnabled = YES;
        _collectView.alwaysBounceVertical = YES;

        //设置背景颜色
        _collectView.backgroundColor = SM_backGroundColor;
    }
    return _collectView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[BaseTableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate             = self;
        _tableView.dataSource           = self;
        _tableView.emptyDataSetSource   = self;
        _tableView.emptyDataSetDelegate = self;
        _tableView.backgroundColor      = SM_backGroundColor;
        _tableView.tableFooterView      = [UIView new];
    }
    return _tableView;
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
    float itemSize = (SM_SCREEN_WIDTH*2.f)/9.f;
    flowLayout.itemSize = CGSizeMake(itemSize, itemSize*3.f/5);
    return flowLayout;
}

- (UIButton *)confirmButton
{
    if (!_confirmButton) {
        _confirmButton = [UIButton new];
        [_confirmButton setTitle:@"立即结算" forState:UIControlStateNormal];
        [_confirmButton setTitleColor:SM_whiteColor forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[UIImage imageWithColor:SM_thumeColor] forState:UIControlStateNormal];
        [_confirmButton setBackgroundImage:[UIImage imageWithColor:RGBACOLOR(0, 0, 0, .26)] forState:UIControlStateDisabled];
        _confirmButton.titleLabel.font = SM_CFont(38);
        [_confirmButton addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _confirmButton;

}

- (UIButton *)shopCartButton
{
    if (!_shopCartButton) {
        _shopCartButton = [UIButton new];
        [_shopCartButton setImage:[UIImage imageNamed:@"ic_shoppingCart"] forState:UIControlStateNormal];
    }
    return _shopCartButton;
}

- (UILabel *)prizeLabel
{
    if (!_prizeLabel) {
        _prizeLabel = [UILabel new];
        _prizeLabel.font = SM_CFont(35);
        _prizeLabel.textAlignment = NSTextAlignmentCenter;
        _prizeLabel.text = @"线下支付";
        _prizeLabel.textColor = HEXCOLOR(@"#FC5E5F");
    }
    return _prizeLabel;
}

- (UIButton *)badgeView
{
    if (!_badgeView) {
        _badgeView = [UIButton new];
        _badgeView.backgroundColor = kRedColor;
        _badgeView.titleLabel.font = SM_CFont(25);
        [_badgeView setTitleColor:SM_whiteColor forState:UIControlStateNormal];
        _badgeView.layer.cornerRadius = SM_SIZE(32)/2;
        _badgeView.clipsToBounds = YES;
        _badgeView.contentEdgeInsets = UIEdgeInsetsMake(SM_SIZE(10), SM_SIZE(10), SM_SIZE(10), SM_SIZE(10));

    }
    return _badgeView;
}

- (void)setPrize:(NSString *)price
{
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc]initWithString:@"总价：" attributes:@{NSForegroundColorAttributeName:SM_blackColor}];
    if (price.length) {
        price = [@"￥" stringByAppendingString:price];
        NSAttributedString *priceAttri = [[NSAttributedString alloc]initWithString:price attributes:@{NSForegroundColorAttributeName:HEXCOLOR(@"#FC5E5F")}];
        [attri appendAttributedString:priceAttri];
    }
    self.prizeLabel.attributedText = attri;
}


#pragma mark - collect view delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.categorys.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTConsumerGoodCategoryCollectCell *cell = [KTConsumerGoodCategoryCollectCell collectCellWithCollectionView:collectionView atIndexPath:indexPath];
    cell.titleLabel.text = [self.categorys[indexPath.item] allKeys][0];
    cell.kt_selected = self.selectedSection == indexPath.item;
    [cell setBadge:[self.sectionNumDictionary[[@(indexPath.item) stringValue]] unsignedIntegerValue]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedSection = indexPath.item;
    [self.collectView reloadData];
}

#pragma mark - Setters
BOOL isAnimating = NO;
- (void)setSelectedSection:(NSUInteger)selectedSection
{
    _selectedSection = selectedSection;
    isAnimating = YES;
    [UIView animateWithDuration:.2 animations:^{
        [self.tableView setContentOffset:[self.sectionOffsets[selectedSection] CGPointValue] animated:NO];
    } completion:^(BOOL finished) {
        isAnimating = NO;
    }];

}

- (void)setBadge:(NSUInteger)number
{
    _badgeView.hidden = !number;
    [_badgeView setTitle:[@(number)stringValue] forState:UIControlStateNormal];
}

#pragma mark - table view delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (isAnimating) {
        return;
    }
    CGFloat currentY = scrollView.contentOffset.y;
    for (NSUInteger i = 0; i < self.sectionOffsets.count; i ++) {
        CGFloat offset_y = [self.sectionOffsets[i] CGPointValue].y;
        if (currentY > offset_y) {
            _selectedSection = i;
        }
    }
    [self.collectView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.categorys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.categorys[section][[self.categorys[section] allKeys][0]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OMConsumerGoodTableCell *cell = [OMConsumerGoodTableCell tableViewCellWithTableView:tableView];
    NSDictionary *dic = [self.categorys[indexPath.section] allObjects][0][indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:dic[@"icon"]];
    cell.titleLabel.text = dic[@"title"];
    cell.priceLabel.text = dic[@"price"];
    cell.delegate = self;
    cell.stockLabel.text = [NSString stringWithFormat:@"库存：%@",dic[@"stock"]];
    cell.num = [self.numberDictionary[indexPath] unsignedIntegerValue];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SM_SCREEN_WIDTH, self.tableView.sectionHeaderHeight)];
    label.font = SM_CFont(29);
    label.textColor = SM_whiteColor;
    label.backgroundColor = SM_thumeColor;
    label.text = [@"  " stringByAppendingString: [self.categorys[section] allKeys][0]] ;
    return label;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    return [[NSAttributedString alloc]initWithString:@"暂无数据"
                                          attributes:@{
                                                       NSFontAttributeName:SM_CFont(30),
                                                       NSForegroundColorAttributeName:SM_darkGrayColor
                                                       }];
}

/*
-(void)viewDidLayoutSubviews
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }

    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }

    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
 */

#pragma mark - OMConsumerGoodTableCellDelegate
- (void)didChangeNumber:(NSUInteger)num atIndexPath:(NSIndexPath *)indexPath
{
    if (!indexPath) {
        return;
    }
    self.numberDictionary[indexPath] = @(num);
    self.sectionNumDictionary = [NSMutableDictionary dictionaryWithCapacity:self.categorys.count];
    NSUInteger count_all = 0;
    for (NSIndexPath *indexPath in self.numberDictionary.allKeys) {
        NSUInteger count = [self.numberDictionary[indexPath] unsignedIntegerValue];
        NSUInteger pre_count = [self.sectionNumDictionary[[@(indexPath.section) stringValue]] unsignedIntegerValue];
        self.sectionNumDictionary[[@(indexPath.section) stringValue]] = @(pre_count+count);
        count_all += count;
    }
    [self.collectView reloadData];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [self setBadge:count_all];
}


- (void)didClickPlusButton:(UIButton *)button
{
    CGPoint generatePoint = [button.superview convertPoint:button.center toView:self.view];
    CGPoint middlePoint = CGPointMake(generatePoint.x-SM_SIZE(100), generatePoint.y-SM_SIZE(60));
    CGPoint distinatePoint = self.shopCartButton.center;

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:generatePoint];
    [path addQuadCurveToPoint:middlePoint controlPoint:CGPointMake((generatePoint.x+middlePoint.x)/2.f, (generatePoint.y+middlePoint.y)/3.f)];
    [path addQuadCurveToPoint:distinatePoint controlPoint:CGPointMake((distinatePoint.x+middlePoint.x)/3.f, (distinatePoint.y+middlePoint.y)/3)];

    CAShapeLayer *dot   = [CAShapeLayer layer];
    CGFloat width       = SM_SIZE(30);
    dot.frame           = CGRectMake(0, 0, width, width);
    dot.position        = distinatePoint;
    dot.backgroundColor = kRedColor.CGColor;
    dot.cornerRadius    = width/2;
    dot.masksToBounds   = YES;
    [self.view.layer insertSublayer:dot below:self.shopCartButton.layer];

    double duration                 = .8f;
    CAKeyframeAnimation *animation  = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path                  = path.CGPath;
    animation.duration              = duration;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [dot addAnimation:animation forKey:nil];


    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [dot removeFromSuperlayer];
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue         = @(1);
        scaleAnimation.toValue           = @(1.1);
        scaleAnimation.autoreverses      = YES;
        scaleAnimation.duration          = .2;
        scaleAnimation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        [self.shopCartButton.layer addAnimation:scaleAnimation forKey:nil];
    });

}

#pragma mark - Actions
- (void)submitAction:(UIButton *)sender
{
//    NaviPush(@"KTConsumerGoodsSubmitViewController", @{@"title":@"百货到家"});
}
@end
