//
//  XYWelfareCell.h
//  Mixshq
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYClickCellModel.h"
#import "XYWelfareCollectionViewCell.h"

@protocol XYWelfareCellDelegate <NSObject>
@optional

- (void)updateCellHeightWith:(CGFloat)cellNewHeight
                   indexpath:(NSIndexPath *)indexpath
                newCellModel:(XYClickCellModel*)newCellModel;

@end

@interface XYWelfareCell : UITableViewCell

+(XYWelfareCell *)cellWithTableView:(UITableView *)tableView
                       ForIndexPath:(NSIndexPath *)indexpath
                           delegate:(id<XYWelfareCellDelegate>)delegate;
- (void)updateCellWith:(XYClickCellModel *)clickCellModel;

+ (NSString *)getCellIdentifier;
@end
