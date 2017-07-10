//
//  XYClickCellModel.h
//  Mixshq
//
//  Created by 123 on 2017/7/4.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYClickCellModel : NSObject

@property (copy, nonatomic) NSString *introduce;
@property (copy, nonatomic) NSString *detailRequire;
@property (assign, nonatomic) BOOL isShowRedPoint;
@property (assign, nonatomic) BOOL isShowRightArrow;
@property (assign, nonatomic) BOOL userInteractionEnabled;

@end
