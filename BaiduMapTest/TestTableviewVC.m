//
//  TestTableviewVC.m
//  BaiduMapTest
//
//  Created by 123 on 2017/6/9.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "TestTableviewVC.h"
#import "XYOrderCell.h"
#import "XYShopActivityHeaderView.h"


@interface TestTableviewVC ()<UITableViewDataSource,UITableViewDelegate,XYShopActivityHeaderViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *dataTableview;
@property (strong, nonatomic) XYShopActivityHeaderView *testview;
@end

@implementation TestTableviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self update];
}

- (void)update{
    
    _testview = [XYShopActivityHeaderView createViewWithDelegate:self];
//    view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 177);
    _dataTableview.tableHeaderView = _testview;
}
- (void)testHeight:(XYShopActivityHeaderView *)view{
    _dataTableview.frame = view.frame;
    _dataTableview.tableHeaderView = view;
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
