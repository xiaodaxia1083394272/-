//
//  XYJodHeaderView.h
//  Mixshq
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYJodHeaderViewDelegate <NSObject>
@optional
//
@end

@interface XYJodHeaderView : UIView


+ (XYJodHeaderView *)createViewWithDelegate:(id<XYJodHeaderViewDelegate>)delegate;


@end
