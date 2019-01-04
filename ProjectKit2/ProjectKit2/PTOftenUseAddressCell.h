//
//  PTOftenUseAddressCell.h
//  520SHQ
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSInteger const editType = 17122510;
static NSInteger const deleteType = 17122509;

@protocol PTOftenUseAddressCellDetegate<NSObject>
@optional
- (void)clickBtnType:(NSInteger)btnType indexPath:(NSIndexPath *)indexPath;
@end

@interface PTOftenUseAddressCell : UITableViewCell
@property (nonatomic,weak) id<PTOftenUseAddressCellDetegate> delegate;
@property (nonatomic,strong) NSIndexPath *indexPath;
@property (nonatomic,strong) UILabel *sendAddressLB;

@end
