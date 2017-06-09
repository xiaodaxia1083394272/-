//
//  TestTableviewVC.m
//  BaiduMapTest
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "TestTableviewVC.h"
#import "XYOrderCell.h"

@interface TestTableviewVC ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *dataTableview;

@end

@implementation TestTableviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark -------------tableviewDelegate----------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [XYOrderCell getCellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    XYOrderCell *cell =  [XYOrderCell cellWithTableView:tableView ForIndexPath:indexPath];
    
    //cell.delegate = self;
    
    return cell;
    
}

@end
