//
//  UIViewController+ShowAlert.m
//  ProjectKit
//
//  Created by HMRL on 2018/5/26.
//  Copyright © 2018年 Low-Key. All rights reserved.
//

#import "UIViewController+ShowAlert.h"

@implementation UIViewController (ShowAlert)
- (void)showAlert:(NSString *)alertStr{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:alertStr preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *sureAct = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }] ;
    
    [alertVC addAction:sureAct];
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
