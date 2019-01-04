//
//  SHBaseTabBarVC.h
//  520SHQ
//
//  Created by Macx on 2017/8/31.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHBaseNavVC.h"
//#import "UITabBarController+extention.h"

@interface SHBaseTabBarVC : UITabBarController
+(instancetype)hf_tabBarVC;
+(instancetype)hf_tabBarVCWithVcArr:(NSArray<UIViewController*> *)vcArr vcTitles:(NSArray<NSString *>*)vcTitles normalImages:(NSArray *)normalImages selectedImages:(NSArray<NSString *> *)selectedImages;

@end
