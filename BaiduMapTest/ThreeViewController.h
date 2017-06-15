//
//  ThreeViewController.h
//  BaiduMapTest
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^testBlock)(NSString*test);

@interface ThreeViewController : UIViewController
@property (nonatomic, copy)  testBlock littleBlock;

@end
