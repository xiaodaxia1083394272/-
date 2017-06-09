//
//  MemedaVC.m
//  BaiduMapTest
//
//  Created by HMRL on 17/5/18.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "MemedaVC.h"
#import "TwoViewController.h"
#import "TestTableviewVC.h"

@interface MemedaVC ()

@end

@implementation MemedaVC

- (void)viewDidLoad {
    [super viewDidLoad];

   self.title = @"你好";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickBtn:(id)sender {
    
    TwoViewController *vc = [TwoViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)clickTestTableviewBtn:(id)sender {
    TestTableviewVC *vc = [TestTableviewVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
