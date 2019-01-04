//
//  PTOftenUseAddressCell.m
//  520SHQ
//
//  Created by Macx on 2017/12/7.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import "PTOftenUseAddressCell.h"
#import "UIButton+extension.h"

@interface PTOftenUseAddressCell()

@end

@implementation PTOftenUseAddressCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.clipsToBounds = NO;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.sendAddressLB = [UILabel new];
        [self.contentView addSubview:self.sendAddressLB];
        self.sendAddressLB.text = @"";

        
        [self makeMas];
        
    }
    return self;
}

-(void)makeMas
{
    kWeakSelf(self);
    
    self.sendAddressLB.font = CHINESE_SYSTEM(kFitW(15));
    self.sendAddressLB.numberOfLines = 2;
    [self.sendAddressLB setTextColor:hexCOLOR(@"212121")];
    [self.sendAddressLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakself.contentView.mas_right).offset(kFitW(-15));
            make.left.mas_equalTo(weakself.contentView).offset(kFitW(15));
        make.centerY.mas_equalTo(weakself.contentView);
    }];
    
    UIView *line = [UIView new];
    [self.contentView addSubview:line];
    line.backgroundColor = kGlobalBgColor;
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(kFitW(1));
        make.width.mas_equalTo(kScreenW);
        make.height.mas_equalTo(kFitW(1));
    }];
}


@end
