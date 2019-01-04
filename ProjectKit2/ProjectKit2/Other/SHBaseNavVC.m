//
//  SHBaseNavVC.m
//  520SHQ
//
//  Created by Macx on 2017/8/31.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import "SHBaseNavVC.h"
#import "UIButton+extension.h"
@interface SHBaseNavVC ()
<UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@end

@implementation SHBaseNavVC
+(void)initialize{
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = XLNavColor;
    [bar setTitleTextAttributes:@{NSFontAttributeName : kBoldSysFont(18),NSForegroundColorAttributeName:kWhiteColor}];
    bar.translucent = NO;
    // 设置item
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kWhiteColor,NSFontAttributeName:kSysFont(15)} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kWhiteColor} forState:UIControlStateDisabled];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //kWeakSelf(self);
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
     //   kStrongSelf(self);
        self.interactivePopGestureRecognizer.delegate = self;
        self.delegate = self;
    }
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"正在进入:%@",viewController);
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
////        regBack
//        [button setImage:[UIImage imageNamed:@"FSNav_back_write"] forState:UIControlStateNormal];
////        button.frame.size = CGSizeMake(20.f,20.f);
//        button.xl_expandLength = 30.f;
//        // 让按钮内部的所有内容左对齐
//        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        //        [button sizeToFit];
//        // 让按钮的内容往左边偏移3
//        button.contentEdgeInsets = UIEdgeInsetsMake(0, 3, 0, 0);
//
//        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//
//        // 修改导航栏左边的item
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        // 隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;
 
   
    [super pushViewController:viewController animated:animated];
 // 修改tabBra的frame
//    if (kScreenH==812) {
//        CGRect frame = self.tabBarController.tabBar.frame;
//        if (frame.origin.y < (kScreenH - 83)) {
//            frame.origin.y = kScreenH - 83;
//            self.tabBarController.tabBar.frame = frame;
//        }
//    }


}
- (void)back{
    [self backToPreVC];
}

- (void)backToPreVC{
    [self popViewControllerAnimated:YES];
}
#pragma mark****UINavigationControllerDelegate*****
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated

{   if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    self.interactivePopGestureRecognizer.enabled = YES;
    
    
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





@end
