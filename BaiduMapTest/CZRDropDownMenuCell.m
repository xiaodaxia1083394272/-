//
//  CZRDropDownMenuCell.m
//  封装下拉菜单
//
//  Created by Macx on 2017/3/18.
//  Copyright © 2017年 Macx. All rights reserved.
//

#import "CZRDropDownMenuCell.h"
//#import "UIView+ClipRound.h"

@implementation CZRDropDownMenuCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
     
        self.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
        
        CGFloat labelW = self.contentView.frame.size.width;
        CGFloat labelH = self.contentView.frame.size.height;
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, labelW, labelH);
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label];
        
        _titleLabel = label;
        
        // 切圆角
//        [UIView cutRound:self size:CGSizeMake(5, 10)];
        
    }
    return self;
}

@end
