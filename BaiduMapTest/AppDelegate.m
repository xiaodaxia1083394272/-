//
//  AppDelegate.m
//  BaiduMapTest
//
//  Created by HMRL on 17/5/18.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "AppDelegate.h"
#import "MemedaVC.h"

#import "MyENavigationController.h"



@interface AppDelegate ()<UITabBarControllerDelegate>

@property (strong, nonatomic) MyENavigationController *firstNavigationController;



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (storyboard) {
        self.window.rootViewController = [storyboard instantiateInitialViewController];
        [self.window makeKeyAndVisible];
        //        self.launchView = [[NSBundle mainBundle ]loadNibNamed:@"LaunchScreen" owner:nil options:nil][0];
        //        _launchView.frame = CGRectMake(0, 0, self.window.screen.bounds.size.width, self.window.screen.bounds.size.height);
        //        [self.window addSubview:_launchView];
        //
        //        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 50, 320, 300)];
        ////        NSString *str = @"http://www.jerehedu.com/images/temp/logo.gif";
        ////        [imageV sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"default1.jpg"]];
        //        imageV.image = [UIImage imageNamed:@"backLaunch.jpg"];
        //        [_launchView addSubview:imageV];
        //
        //        [self.window bringSubviewToFront:_launchView];
        //
        //        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(removeLun) userInfo:nil repeats:NO];
        UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
        tabBarController.tabBar.translucent = NO;
        tabBarController.delegate = self;
        
        //设置第一个Controller
        self.firstNavigationController = (MyENavigationController *)[tabBarController.viewControllers objectAtIndex:0];//这个viewControllers里装的是NavigationController而不是viewController吗？略神奇 其实我觉得应该是类似于实例化
        
        //游戏规则
        //做过才能理解
        MemedaVC *jvc = [[MemedaVC alloc] init];
        
        self.firstNavigationController.viewControllers = @[jvc];
    
    }
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
