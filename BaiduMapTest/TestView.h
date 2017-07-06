//
//  TestView.h
//  BaiduMapTest
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestView : UIView
@property (weak, nonatomic) IBOutlet UIButton *testBtn;

+ (TestView *)createView;

@end
