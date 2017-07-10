//
//  XYClickCellDataSource.m
//  Mixshq
//
//  Created by HMRL on 17/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYClickCellDataSource.h"



@implementation XYClickCellDataSource

+ (NSMutableArray *)getClickCellDataListWithIsShowRedPoint:(BOOL)isShowRedPoint
                                          isShowRightArrow:(BOOL)isShowRightArrow
                                    userInteractionEnabled:(BOOL)userInteractionEnabled{
    //初始值1
    NSArray *introduceList = @[@"职位名称",@"招聘人数",@"年龄",@"工作年限",@"学历",@"月薪",@"福利",@"工作性质",@"联系地址",@"职能类别1",@"职能类别2",@"关键字",@"描述",@"排序",@"立即发布"];
    NSArray *detailList = @[@"电子商务",@"若干",@"不限",@"不限",@"不限",@"不限",@"仅占位用6",@"全职",@"仅占位用8",@"计算机软件",@"计算机软件",@"仅占位用11",@"仅占位用12",@"仅占位用13",@"是"];
    
    NSMutableArray *clickCellModelList = [NSMutableArray array];
    //初始值,定制15个，
    for (int i = 0; i<15;i++){
        
        XYClickCellModel *model = [XYClickCellModel new];
        model.introduce = introduceList[i];
        model.detailRequire = detailList[i];
        model.isShowRedPoint = isShowRedPoint;
        model.isShowRightArrow = isShowRightArrow;
        model.userInteractionEnabled = userInteractionEnabled;
        
        [clickCellModelList addObject:model];
    }
    
    return clickCellModelList;
}


//+ (NSMutableArray *)getSelectCellDataList{
//   
//    NSArray *introduceList = @[@"福利",@"联系地址",@"关键字",@"描述",@"排序"];
//    NSMutableArray *selectCellModelList = [NSMutableArray array];
//    //5个，
//    for (int i = 0; i<15;i++){
//        
//        XYClickCellModel *model = [XYClickCellModel new];
//        model.introduce = introduceList[i];
//        model.isShowRedPoint = YES;
//        model.isShowRightArrow = YES;
//        
//        [selectCellModelList addObject:model];
//    }
//    
//    return selectCellModelList;
//    
//}

@end
