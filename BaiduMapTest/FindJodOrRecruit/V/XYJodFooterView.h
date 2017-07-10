//
//  XYJodFooterView.h
//  Mixshq
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XYJodFooterViewDelegate <NSObject>
@optional
//
@end

@interface XYJodFooterView : UIView

+ (XYJodFooterView *)createViewWithDelegate:(id<XYJodFooterViewDelegate>)delegate;


@end
