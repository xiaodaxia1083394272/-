//
//  TwoViewController.m
//  BaiduMapTest
//
//  Created by HMRL on 17/5/18.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"


@interface TwoViewController ()


@end

@implementation TwoViewController

- (instancetype)initCompletion:(void(^)(NSString *))testBlock{
    
    self = [super init];
    if (self) {
        
        _littleBlock = testBlock;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
}

- (IBAction)clickTestButton:(id)sender {
    
    
    ThreeViewController *vc = [ThreeViewController new];
    vc.littleBlock = ^(NSString *test) {
      
            if(_littleBlock != nil) {
        
                _littleBlock(test);
            }
    };
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
