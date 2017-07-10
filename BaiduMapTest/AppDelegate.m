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



@interface AppDelegate ()<UITabBarControllerDelegate,UIAlertViewDelegate>

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
    
    [self performSelector:@selector(releaseNotification) withObject:nil/*可传任意类型参数*/ afterDelay:30];
    
    
    return YES;
}


- (void)releaseNotification{
    
    UILocalNotification *notification=[[UILocalNotification alloc] init];
    notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:10];
    notification.alertBody=@"闹钟响了。";
    notification.alertTitle=@"请打开闹钟";
    notification.repeatInterval=NSCalendarUnitSecond;
    　　 //设置本地通知的时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.applicationIconBadgeNumber=1;
    
    notification.userInfo=@{@"name":@"zhangsanfeng"};
    notification.soundName=UILocalNotificationDefaultSoundName;
    
    //[[UIApplication sharedApplication]scheduleLocalNotification:notification];
    //[[UIApplication sharedApplication]presentLocalNotificationNow:notification];
}

- (void)cancelNotification{
    
    UIApplication *app=[UIApplication sharedApplication];
    NSArray *array=[app scheduledLocalNotifications];
    NSLog(@"%ld",array.count);
    
    for (UILocalNotification * local in array) {
        NSDictionary *dic= local.userInfo;
        if ([dic[@"name"] isEqual:@"zhangsanfeng"]) {
            //删除指定的通知
            [app cancelLocalNotification:local];
        }
    }
}

/*
 需要注意的是，在情况a中，如果用户点击提醒进入应用程序，也会执行收到本地通知的回调方法，这种情况下如果你添加了上面那段代码，则会出现连续出现两次提示，为了解决这个问题，修改代码如下:(前提是你的应用程序不处于激活状态，本地通知才会有效果)
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    //如果你想实现程序在后台时候的那种提醒效果，可以在这个方法中添加相关代码（添加个警告视图）
    
    //判断应用程序当前的运行状态，如果是激活状态，则进行提醒，否则不提醒
    if (application.applicationState == UIApplicationStateActive) {
        //显示警告内容
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"memeda" message:@"memexiao" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"done", nil];
        [alert show];
    }
}



@end
