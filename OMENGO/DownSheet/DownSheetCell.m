//
//  DownSheetCell.m
//  audioWriting
//
//  Created by wolf on 14-7-19.
//  Copyright (c) 2014年 wangruiyy. All rights reserved.
//

#import "DownSheetCell.h"
#import "MainConfigure.h"
@implementation DownSheetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        leftView = [[UIImageView alloc]init];
        InfoLabel = [[UILabel alloc]init];
        InfoLabel.backgroundColor = [UIColor clearColor];
        InfoLabel.textAlignment = NSTextAlignmentCenter;
        InfoLabel.textColor = HEXCOLOR(@"333333");//RGBCOLOR(0, 0, 0);
        [self.contentView addSubview:leftView];
        [self.contentView addSubview:InfoLabel];
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    leftView.frame = CGRectMake(20, (self.frame.size.height-20)/2, 20, 20);
    InfoLabel.frame = CGRectMake(0, (self.frame.size.height-20)/2, self.frame.size.width, 20);
}

-(void)setData:(DownSheetModel *)dicdata{
    cellData = dicdata;
//    leftView.image = [UIImage imageNamed:dicdata.icon];
    InfoLabel.text = dicdata.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if(selected){
        self.backgroundColor = RGBCOLOR(151, 151, 151);
//        leftView.image = [UIImage imageNamed:cellData.icon_on];
//        InfoLabel.textColor = [UIColor whiteColor];
    }else{
//        self.backgroundColor = [UIColor whiteColor];
//        leftView.image = [UIImage imageNamed:cellData.icon];
//        InfoLabel.textColor = [UIColor blackColor];
    }
    // Configure the view for the selected state
}


- (void)drawRect:(CGRect)rect{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    [bp moveToPoint:CGPointMake(0, self.frame.size.height - .5f)];
    [bp addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height - 0.5f)];
    [bp addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [bp addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [bp closePath];
    [RGBACOLOR(151, 151, 151, 0.5f) setFill];
    [bp fill];
}

@end

