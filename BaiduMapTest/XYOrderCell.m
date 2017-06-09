//
//  XYOrderCell.m
//  Mixshq
//
//  Created by 123 on 2017/6/8.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYOrderCell.h"

@implementation XYOrderCell

static NSString *const cellID = @"XYOrderCell";
+(XYOrderCell *)cellWithTableView:(UITableView *)tableView ForIndexPath:(NSIndexPath *)indexpath
{
    [tableView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];
    XYOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexpath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

+ (CGFloat)getCellHeight{
    
    return 80;
}

@end
