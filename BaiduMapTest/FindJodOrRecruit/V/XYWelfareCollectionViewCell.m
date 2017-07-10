//
//  XYWelfareCollectionViewCell.m
//  Mixshq
//
//  Created by 123 on 2017/7/6.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYWelfareCollectionViewCell.h"

@implementation XYWelfareCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CGFloat imageW = self.contentView.frame.size.width;
        CGFloat imageH = self.contentView.frame.size.height;
        UIImageView *image = [[UIImageView alloc] init];
        image.frame = CGRectMake(0, 0, imageW, imageH);
        
        [self.contentView addSubview: image];
        
        _imageView = image;
        _imageView.backgroundColor = [UIColor orangeColor];
    }
    return self;
}

@end
