//
//  XYShopActivityHeaderView.h
//  Mixshq
//
//  Created by 123 on 2017/6/16.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XYShopActivityModel;
@class XYShopActivityHeaderView;
@protocol XYShopActivityHeaderViewDelegate <NSObject>
@optional

- (void)addCellWith:(XYShopActivityModel *)shopActivityModel;
- (void)testHeight:(XYShopActivityHeaderView *)view;
@end

@interface XYShopActivityHeaderView : UIView

+ (XYShopActivityHeaderView *)createViewWithDelegate:(id<XYShopActivityHeaderViewDelegate>)delegate;

@end
