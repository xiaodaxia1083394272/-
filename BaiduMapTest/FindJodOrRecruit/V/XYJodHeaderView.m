//
//  XYJodHeaderView.m
//  Mixshq
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYJodHeaderView.h"

@interface XYJodHeaderView()

@property (assign, nonatomic) id<XYJodHeaderViewDelegate>delegate;

@end

@implementation XYJodHeaderView

+ (XYJodHeaderView*)createViewWithDelegate:(id<XYJodHeaderViewDelegate>)delegate

{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"XYJodHeaderView" owner:self options:nil];
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        return nil;
    }
    XYJodHeaderView *view = (XYJodHeaderView *)[topLevelObjects objectAtIndex:0];
    view.delegate = delegate;
    
    return view;
}

@end
