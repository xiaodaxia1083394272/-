//
//  UIButton+PKButton.h
//  ProjectKit
//
//  Created by HMRL on 2018/8/4.
//  Copyright © 2018年 Low-Key. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, btn) {
  btnA = 0
};

@interface UIButton (PKButton)
- (void)test:(btn)a;
@end
