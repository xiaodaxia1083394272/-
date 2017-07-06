//
//  TestView.m
//  BaiduMapTest
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "TestView.h"

@implementation TestView

+ (TestView *)createView

{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"TestView" owner:self options:nil];
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        return nil;
    }
    TestView *view = (TestView *)[topLevelObjects objectAtIndex:0];
    
    NSLog(@"-------1");
    return view;
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    
    NSLog(@"---------2");
}


@end
