//
//  ThreeViewController.m
//  BaiduMapTest
//
//  Created by 123 on 2017/6/15.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)clickThreeBtn:(id)sender {
    
    if(_littleBlock != nil) {
        
        _littleBlock(@"memexiao");
    }
//    NSInteger popIndex = self.navigationController.viewControllers.count - 3;
//    
//    UIViewController *vc = self.navigationController.viewControllers[popIndex];
//
//    [self.navigationController popToViewController:vc animated:YES];
    
    [self.navigationController popViewControllerAnimated:YES];
}


@end
