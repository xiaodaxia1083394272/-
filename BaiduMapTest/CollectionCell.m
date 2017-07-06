//
//  CollectionCell.m
//  BaiduMapTest
//
//  Created by 123 on 2017/7/5.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
        
        CGFloat labelW = self.contentView.frame.size.width;
        CGFloat labelH = self.contentView.frame.size.height;
        UIImageView *label = [[UIImageView alloc] init];
        label.frame = CGRectMake(0, 0, labelW, labelH);
//        label.textAlignment = NSTextAlignmentCenter;
//        label.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label];
        
        _titleLabel = label;
        
        // 切圆角
//        [UIView cutRound:self size:CGSizeMake(5, 10)];
        
    }
    return self;
}

@end
