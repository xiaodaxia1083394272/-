//
//  XYClickCellDataSource.h
//  Mixshq
//
//  Created by HMRL on 17/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYClickCellModel.h"

//@interface XYClickCellModel : NSObject
//
//@property (copy, nonatomic) NSString *introduce;
//@property (copy, nonatomic) NSString *detailRequire;
//@property (assign, nonatomic) BOOL isShowRedPoint;
//@property (assign, nonatomic) BOOL isShowRightArrow;
//
//@end

@interface XYClickCellDataSource : NSObject

+ (NSMutableArray *)getClickCellDataListWithIsShowRedPoint:(BOOL)isShowRedPoint
                                          isShowRightArrow:(BOOL)isShowRightArrow
                                    userInteractionEnabled:(BOOL)userInteractionEnabled;
//+ (NSMutableArray *)getSelectCellDataList;

@end
