//
//  XYOrderCell.h
//  Mixshq
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYOrderCell : UITableViewCell

+(XYOrderCell *)cellWithTableView:(UITableView *)tableView ForIndexPath:(NSIndexPath *)indexpath;

+ (CGFloat)getCellHeight;
@end
