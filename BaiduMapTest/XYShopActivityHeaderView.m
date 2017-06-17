//
//  XYShopActivityHeaderView.m
//  Mixshq
//
//  Created by 123 on 2017/6/16.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYShopActivityHeaderView.h"

@interface XYShopActivityHeaderView()<UITextFieldDelegate,UITextViewDelegate>

@property (assign, nonatomic) id<XYShopActivityHeaderViewDelegate>delegate;

@property (weak, nonatomic) IBOutlet UITextView *testTV;
@end

@implementation XYShopActivityHeaderView

+ (XYShopActivityHeaderView *)createViewWithDelegate:(id<XYShopActivityHeaderViewDelegate>)delegate

{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"XYShopActivityHeaderView" owner:self options:nil];
    if (topLevelObjects == nil || [topLevelObjects count] <= 0){
        return nil;
    }
    XYShopActivityHeaderView *view = (XYShopActivityHeaderView *)[topLevelObjects objectAtIndex:0];
    view.delegate = delegate;
    return view;
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    
    if([_delegate respondsToSelector:@selector(testHeight:)]){
        [_delegate testHeight:self];
    }
}

- (IBAction)clickTestBtn:(id)sender {
    
    [_testTV resignFirstResponder];
}



@end
