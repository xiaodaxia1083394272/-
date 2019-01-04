//
//  SHPTTabBarVC.m
//  520SHQ
//
//  Created by Macx on 2017/12/1.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import "SHPTTabBarVC.h"
#import "PTHomeVC.h"




@interface SHPTTabBarVC ()<UITabBarControllerDelegate>

@end

@implementation SHPTTabBarVC

+(instancetype)hf_tabBarVC{
    NSArray *vcArr = @[[PTHomeVC new],[[UIViewController alloc] init],[UIViewController new]];
    NSArray *titles=@[@"首页",@"测试",@"其他"];
    NSArray *nomalImages=@[@"home",@"home",@"home"];
    NSArray *selectedImages=@[@"home",@"home",@"home"];
    
    return  [self hf_tabBarVCWithVcArr:vcArr vcTitles:titles normalImages:nomalImages selectedImages:selectedImages];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;

}

//- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    if (self.childViewControllers.firstObject == viewController) {
//        return YES;
//    }else{
//        if (LOGINTOOL.isLogin) {
//            return YES;
//        }else{
//            SHLoginVC *loginVC = [[SHLoginVC alloc]init];
////            kWeakSelf(self);
//            loginVC.LoginSuccess = ^{
//                kStrongSelf(self);
//                [self setSelectedViewController:viewController];
//            };
//            [self presentViewController:loginVC animated:YES completion:nil];
//            return NO;
//
//        }
//    }
//}



@end
