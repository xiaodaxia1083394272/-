//
//  XYBtn.m
//  Mixshq
//
//  Created by HMRL on 17/6/4.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYBtn.h"

@interface XYBtn()

@property (assign, nonatomic) BOOL isTest;

@end

@implementation XYBtn

// 自定义按钮的frame方法
- (instancetype)initWithFrame:(CGRect)frame isShow:(BOOL)isShow
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        // 字体不分状态
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor greenColor];
        self.isTest = isShow;
    }
    return self ;
}

- (void)update:(BOOL)isTest{
    
    self.isTest = isTest;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = self.frame.size.width;
    CGFloat buttonH = self.frame.size.height;
    CGFloat imageW = 0;
    if (self.isTest){
        imageW = 20;
    }
    self.titleLabel.frame = CGRectMake(0, 0,buttonW - imageW + 5, buttonH);
    self.imageView.frame = CGRectMake(self.titleLabel.frame.size.width - 5, (buttonH - imageW) / 2, imageW, imageW);
}


@end
