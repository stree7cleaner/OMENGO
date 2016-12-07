//
//  DownSheet.m
//  audioWriting
//
//  Created by wolf on 14-7-19.
//  Copyright (c) 2014年 wangruiyy. All rights reserved.
//

#import "DownSheet.h"
#import "MainConfigure.h"
#define cellRowHeight 55.f

@implementation DownSheet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithlist:(NSArray *)list height:(CGFloat)height{
    self = [super init];
    if(self){
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = RGBACOLOR(20, 20, 20, 0);
        view = [[UITableView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth,cellRowHeight*([list count] + 1)) style:UITableViewStylePlain];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;
        view.rowHeight = cellRowHeight;
        listData = list;
        view.scrollEnabled = NO;
        [self addSubview:view];
        [self animeData];
    }
    return self;
}

-(void)animeData{
    //self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancel)];
    [self addGestureRecognizer:tapGesture];
    tapGesture.delegate = self;
    [UIView animateWithDuration:.25 animations:^{
        self.backgroundColor = RGBACOLOR(20, 20, 20, .7);
        [UIView animateWithDuration:.25 animations:^{
            [view setFrame:CGRectMake(view.frame.origin.x, ScreenHeight-view.frame.size.height, view.frame.size.width, view.frame.size.height)];
        }];
    } completion:^(BOOL finished) {
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isKindOfClass:[self class]]){
        return YES;
    }
    return NO;
}

- (void)cancel
{
    !_onCancelAction ?: _onCancelAction();
    [self tappedCancel];
}

-(void)tappedCancel{
    [UIView animateWithDuration:.25 animations:^{
        [view setFrame:CGRectMake(0, ScreenHeight,ScreenWidth, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)showInView:(UIViewController *)Sview
{
    if (self.superview) {
        return;
    }
    
    if(Sview==nil){
        [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
    }else{
        //[view addSubview:self];
        if ([Sview isKindOfClass:[UIView class]]) {
            [((UIView *)Sview) addSubview:self];
            [((UIView *)Sview) bringSubviewToFront:self];
        }else {
            [Sview.view addSubview:self];
        }
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section) {
        return 1;
    }
    return [listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    DownSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        cell = [[DownSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if (indexPath.section) {
        [cell setData:[DownSheetModel downSheetModelWithIcon:nil andIcon_on:nil andTitle:@"取消"]];
        return cell;
    }
    [cell setData:[listData objectAtIndex:indexPath.row]];
    // Configure the cell...
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self tappedCancel];
    if (indexPath.section) {
        !_onCancelAction ?: _onCancelAction();
        return;
    }
    if (_onSelectAction) {
        _onSelectAction(indexPath.row);
    }
    if(_delegate!=nil && [_delegate respondsToSelector:@selector(downSheet:didSelectIndex:)]){
        [_delegate downSheet:self didSelectIndex:indexPath.row];
        return;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return DBL_EPSILON;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
