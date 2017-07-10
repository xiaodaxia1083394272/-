//
//  XYJodClickCell.h
//  Mixshq
//
//  Created by 123 on 2017/7/4.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYClickCellModel.h"


@interface XYJodClickCell : UITableViewCell

+(XYJodClickCell *)cellWithTableView:(UITableView *)tableView ForIndexPath:(NSIndexPath *)indexpath;

- (void)updateCellWith:(XYClickCellModel *)clickCellModel;

@end
