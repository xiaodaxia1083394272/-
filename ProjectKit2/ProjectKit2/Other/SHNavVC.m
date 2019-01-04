//
//  SHNavVC.m
//  520SH
//
//  Created by Macx on 2017/8/17.
//  Copyright © 2017年 520SH.com. All rights reserved.
//

#import "SHNavVC.h"
//#import "SHReMeWabSkipVC.h"
@interface SHNavVC ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation SHNavVC
+(void)initialize{

//    UINavigationBar *bar = [UINavigationBar appearance];
//    bar.barTintColor = XLNavColor;
//    [bar setTitleTextAttributes:@{NSFontAttributeName : kBoldSysFont(18),NSForegroundColorAttributeName:kWhiteColor}];
//    bar.translucent = NO;
//    // 设置item
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//
//    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kWhiteColor,NSFontAttributeName:kSysFont(15)} forState:UIControlStateNormal];
//    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kWhiteColor} forState:UIControlStateDisabled];
  

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
        kWeakSelf(self);
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        kStrongSelf(self);
    self.interactivePopGestureRecognizer.delegate = self;
       self.delegate = self;
 }
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
  if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
//      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//
//      [button setImage:[UIImage imageNamed:@"regBack"] forState:UIControlStateNormal];
//
//      button.size = CGSizeMake(40, 35);
//      // 让按钮内部的所有内容左对齐
//      button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//      //        [button sizeToFit];
//      // 让按钮的内容往左边偏移3
//      button.contentEdgeInsets = UIEdgeInsetsMake(0, 13, 0, 0);
//      [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//      [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//      [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//
//      // 修改导航栏左边的item
//      viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
//      // 隐藏tabbar
      viewController.hidesBottomBarWhenPushed = YES;
      

  }
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;
    [super pushViewController:viewController animated:animated];
    
    // 修改tabBra的frame
//        CGRect frame = self.tabBarController.tabBar.frame;
//        frame.origin.y = [UIScreen mainScreen].bounds.size.height - kTabBarH;
//        self.tabBarController.tabBar.frame = frame;
  
}
- (void)back{
    
    [self popViewControllerAnimated:YES];
}

#pragma mark****UINavigationControllerDelegate*****
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated

{
//    if ([viewController isKindOfClass:[SHReMeWabSkipVC class]]) {
//        self.interactivePopGestureRecognizer.enabled = NO;
//    }else{
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
            self.interactivePopGestureRecognizer.enabled = YES;
//    }
}

#pragma mark****UIGestureRecognizerDelegate*****
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.childViewControllers count] == 1) {
        return NO;
    }
    return YES;
}

// 我们差不多能猜到是因为手势冲突导致的，那我们就先让 ViewController 同时接受多个手势吧。
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
//运行试一试，两个问题同时解决，不过又发现了新问题，手指在滑动的时候，被 pop 的 ViewController 中的 UIScrollView 会跟着一起滚动，解决
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

// 将要显示控制器
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//
//    NSString *classStr = NSStringFromClass([viewController class]);
//    // 判断要显示的控制器是否是自己
//    BOOL isShowHomePage = NO;
//    if ([classStr isEqualToString:@"SHMeVC"] ||
//        [classStr isEqualToString:@"SHFSGoodsDetailVC"] ||
//        [classStr isEqualToString:@"SHReLTTabBarVC"] ||
//        [classStr isEqualToString:@"SHNewKGWebVC"] ||
//        /*[classStr isEqualToString:@"SHReMeWabSkipVC"] ||*/
//        [classStr isEqualToString:@"SHFXWebVC"] ||
//        [classStr isEqualToString:@"SHZBMerchantCenterWebVC"] ||
//        [classStr isEqualToString:@"SHYHTabBarVC"] ||
//        [classStr isEqualToString:@"SHReEntertainmentLskipVC"]||
//        [classStr isEqualToString:@"SHDaiLiHouTaiVC"] ||
//        [classStr isEqualToString:@"ScanViewController"]) {
//
//        isShowHomePage = YES;
//    }
//    [self setNavigationBarHidden:isShowHomePage animated:YES];
//}

@end
