//
//  XYJodFooterView.m
//  Mixshq
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYJodFooterView.h"

@implementation XYJodFooterView

+ (XYJodFooterView*)createViewWithDelegate:(id<XYJodFooterViewDelegate>)delegate

{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"XYJodFooterView" owner:self options:nil];
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        return nil;
    }
    XYJodFooterView *view = (XYJodFooterView *)[topLevelObjects objectAtIndex:0];
//    view.delegate = delegate;
    
    return view;
}

@end
