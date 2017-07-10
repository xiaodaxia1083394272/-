//
//  XYJodClickCell.m
//  Mixshq
//
//  Created by 123 on 2017/7/4.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYJodClickCell.h"

@interface XYJodClickCell()
@property (weak, nonatomic) IBOutlet UILabel *introduceLB;
@property (weak, nonatomic) IBOutlet UILabel *detailLB;
@property (weak, nonatomic) IBOutlet UIImageView *rightArrow;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightArrowwidthConstraint;

@end

@implementation XYJodClickCell


static NSString *const cellID = @"XYJodClickCell";
+(XYJodClickCell *)cellWithTableView:(UITableView *)tableView ForIndexPath:(NSIndexPath *)indexpath
{
    [tableView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];
    XYJodClickCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexpath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)updateCellWith:(XYClickCellModel *)clickCellModel{
    
    _introduceLB.text = clickCellModel.introduce;
    _detailLB.text = clickCellModel.detailRequire;
    
    //控制交互
    self.userInteractionEnabled = clickCellModel.userInteractionEnabled;
    
    if (clickCellModel.isShowRightArrow){
        
        _rightArrow.hidden = NO;
        _rightArrowwidthConstraint.constant = 15;
        
        
    }else{
        
        _rightArrow.hidden = YES;
        _rightArrowwidthConstraint.constant = 0;


        
    }
}

@end
