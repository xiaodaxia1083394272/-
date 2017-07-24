//
//  XYCustomTextView.h
//  BaiduMapTest
//
//  Created by 123 on 2017/7/24.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYCustomTextViewDelegate <NSObject>

- (void)customTextViewNewHeight:(CGFloat)height;

@end

@interface XYCustomTextView : UITextView

@property (assign, nonatomic) id<XYCustomTextViewDelegate> customTextViewDelegate;

@end
