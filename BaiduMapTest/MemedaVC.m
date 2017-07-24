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

#import "XYCustomTextView.h"



@interface MemedaVC ()<XYCustomTextViewDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *testImage;
@property (strong, nonatomic) XYCustomTextView *customTextView;

@end

@implementation MemedaVC

- (void)viewDidLoad {
    [super viewDidLoad];

   self.title = @"你好";
    _testImage.image = [UIImage imageNamed:@"qbuyUp.png"];
    _customTextView = [[XYCustomTextView alloc] initWithFrame:CGRectMake(200, 200, 100, 30)];
    _customTextView.backgroundColor = [UIColor yellowColor];

    _customTextView.customTextViewDelegate = self;
    _customTextView.delegate = self;
    
    [self.view addSubview:_customTextView];
    
    
}

- (void)customTextViewNewHeight:(CGFloat)height{
    
    NSLog(@"_______%lf____",height);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    NSLog(@"___");
    return YES;
}

//- (void)textViewDidBeginEditing:(UITextView *)textView{
//    
//    NSLog(@"___");
//}
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
