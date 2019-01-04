//
//  UIButton+PKButton.m
//  ProjectKit
//
//  Created by HMRL on 2018/8/4.
//  Copyright © 2018年 Low-Key. All rights reserved.
//

#import "UIButton+PKButton.h"

@implementation UIButton (PKButton)

- (void)test:(btn)a{
    
//    self.titleLabel.textColor = kRedColor;
    
    UIImage *myGradient = [UIImage imageNamed:@"gradientColor.png"];
    CGSize sacleSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
    [myGradient drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //    [btnChangeHeart setTitleColor:[UIColor colorWithPatternImage:resizedImage] forState:UIControlStateNormal];
    //
    //
    //    btnChangeHeart.layer.borderColor = [UIColor colorWithPatternImage:resizedImage].CGColor;
    if (a == btnA){
        self.backgroundColor = [UIColor colorWithPatternImage:resizedImage];
        
        [self setTitleColor:kWhiteColor forState:UIControlStateNormal];
    }

}

@end
