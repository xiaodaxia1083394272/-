//
//  SHBaseTabBarVC.m
//  520SHQ
//
//  Created by Macx on 2017/8/31.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import "SHBaseTabBarVC.h"
#import "UIImage+Image.h"
//#import "SHLoginVC.h"
@interface SHBaseTabBarVC ()

@end


@implementation SHBaseTabBarVC
+(void)initialize{
    
    UITabBarItem *item = nil;
    if([[UIDevice currentDevice].systemVersion floatValue]>=9.0){
  item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[SHBaseTabBarVC.self] ];
    
    }else{
      item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    }

    //未被选中状态
    [item setTitleTextAttributes:@{NSFontAttributeName: CHINESE_SYSTEM(kFitW(12)),NSForegroundColorAttributeName:kGrayColor } forState:UIControlStateNormal];
    //被选中
    [item setTitleTextAttributes:@{NSFontAttributeName: CHINESE_SYSTEM(kFitW(12)),NSForegroundColorAttributeName:kRedColor} forState:UIControlStateSelected];
}

-(void)viewDidLoad{
    [super viewDidLoad];
       
 
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 修改tabBra的frame
    if (kScreenH==812) {
        CGRect frame = self.tabBar.frame;
        if (frame.origin.y < (kScreenH - 83)) {
            frame.origin.y = kScreenH - 83;
            self.tabBar.frame = frame;
        }
    }

}

+(instancetype)hf_tabBarVC{
    
    return nil;

}
+(instancetype)hf_tabBarVCWithVcArr:(NSArray<UIViewController *> *)vcArr vcTitles:(NSArray<NSString *> *)vcTitles normalImages:(NSArray *)normalImages selectedImages:(NSArray<NSString *> *)selectedImages{
    id tabBarVC = [[self alloc]init];
    //tabBarVC.tabBar.translucent = NO
    for (int i =0; i<vcArr.count; i++) {
        UIViewController *vc = vcArr[i];
        NSString *title = vcTitles[i];
        NSString *normalImage = normalImages[i];
        NSString *selectedImage = selectedImages[i];
        [tabBarVC setupChildVc:vc title:title image:normalImage selectedImage:selectedImage];
        
    }
    return tabBarVC;
}

//初始化子控制器

- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image =
    [UIImage hf_imageWithOriginalName:image];
    vc.tabBarItem.selectedImage =[UIImage hf_imageWithOriginalName:selectedImage];
    SHBaseNavVC *nav = [[SHBaseNavVC alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];

}


@end
