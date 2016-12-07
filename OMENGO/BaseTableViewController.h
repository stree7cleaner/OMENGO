//
//  BaseTableViewController.h
//  BoWuGuan
//
//  Created by 梁尚嘉 on 2016/10/31.
//  Copyright © 2016年 KT. All rights reserved.
//

#import "BaseViewController.h"
#import "UIScrollView+KTHeader.h"
#import "BaseTableView.h"
@interface BaseTableViewController : BaseViewController
<
UITableViewDelegate,
DZNEmptyDataSetSource,
DZNEmptyDataSetDelegate,
UITableViewDataSource,
UISearchBarDelegate
>

@property (nonatomic, strong) BaseTableView *tableView;



@end
