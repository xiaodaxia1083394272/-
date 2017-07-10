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
#import "CollectionViewTestVC.h"
#import "XYFindOrReleaseJod.h"


@interface MemedaVC ()

@property (weak, nonatomic) IBOutlet UIImageView *testImage;

@end

@implementation MemedaVC

- (void)viewDidLoad {
    [super viewDidLoad];

   self.title = @"你好";
    _testImage.image = [UIImage imageNamed:@"qbuyUp.png"];
}

- (IBAction)clickBtn:(id)sender {
    
    TwoViewController *vc = [TwoViewController new ];
    vc.littleBlock = ^(NSString *test) {
       
        NSLog(@"----%@",test);
    };

    [self.navigationController pushViewController:vc animated:YES];

}

- (IBAction)clickTestTableviewBtn:(id)sender {
    TestTableviewVC *vc = [TestTableviewVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)clickCollectionViewTest:(id)sender {
    
    [self.navigationController pushViewController:[CollectionViewTestVC new] animated:YES];
    
}

- (IBAction)clickReleaseBtn:(id)sender {
    
    [self.navigationController pushViewController:[XYFindOrReleaseJod new] animated:YES];
}

@end
