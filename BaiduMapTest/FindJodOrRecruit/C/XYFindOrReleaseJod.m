//
//  XYFindOrReleaseJod.m
//  Mixshq
//
//  Created by 123 on 2017/7/3.
//  Copyright © 2017年 shqshqshq. All rights reserved.
//

#import "XYFindOrReleaseJod.h"
#import "XYWelfareCell.h"
#import "XYClickCellDataSource.h"
#import "XYJodClickCell.h"
#import "ThreeViewController.h"

@interface XYFindOrReleaseJod ()<UITableViewDelegate,UITableViewDataSource,XYWelfareCellDelegate>

@property (strong, nonatomic) UITableView *dataTableView;

@property (strong, nonatomic) NSArray *cellIndex;
@property (strong, nonatomic) NSMutableArray *clickCellDataList;

@property (strong, nonatomic) NSMutableArray *cellHeightList;

@end

@implementation XYFindOrReleaseJod

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"发布职位";
//    _testValue = 44;
    self.navigationItem.rightBarButtonItem = [self setUpRightBarButtonItems];

    _cellIndex = @[@(0),@(1),@(2),@(3),@(4),@(5),@(7),@(9),@(10),@(11),@(14)];//11
    //同一个数据源喔,默认是关交互的
    _clickCellDataList = [XYClickCellDataSource getClickCellDataListWithIsShowRedPoint:YES
                                                                      isShowRightArrow:NO
                                                                userInteractionEnabled:NO];
    
    //高度
    NSArray *heightList = @[@(44),@(44),@(44),@(44),@(44),@(44),@(200),@(44),@(44),@(44),@(44),@(44),@(44),@(44),@(44)];
    
    _cellHeightList = [NSMutableArray array];
    
     [_cellHeightList addObjectsFromArray:heightList];

    [self.view addSubview:self.dataTableView];

}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];

    _dataTableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.frame.size.height);
    
}

#pragma mark ------------------setUpUI------------------------

- (UITableView *)dataTableView{
    __weak typeof(self)weakSelf = self;
    if(!_dataTableView){
        _dataTableView = [UITableView new];
        _dataTableView.delegate = weakSelf;
        _dataTableView.dataSource = weakSelf;
//        _dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  
    }
    return _dataTableView;
}

- (UIBarButtonItem *)setUpRightBarButtonItems{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 100, 28);
    [rightBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(clickRightTopBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    return rightBarButtonItem;
}

#pragma mark -------------------按钮点击事件-------

- (void)clickRightTopBtn{

    //刷新整个数据源
    for (int i = 0; i < _clickCellDataList.count; i++){
        
        XYClickCellModel *model = (XYClickCellModel *)_clickCellDataList[i];
        model.isShowRedPoint = YES;
        model.isShowRightArrow = YES;
        model.userInteractionEnabled = YES;
        
        [_clickCellDataList replaceObjectAtIndex:i  withObject:model];
    }
    
    //刷新整个
    [_dataTableView reloadData];

}

#pragma mark -----------XYWelfareCellDelegate-------------


- (void)updateCellHeightWith:(CGFloat)cellNewHeight
                   indexpath:(NSIndexPath *)indexpath
                newCellModel:(XYClickCellModel*)newCellModel{
    
    //修改数据源
    [_clickCellDataList replaceObjectAtIndex:indexpath.row withObject:newCellModel];
    //修改高度
    [_cellHeightList replaceObjectAtIndex:indexpath.row withObject:[NSNumber numberWithFloat:cellNewHeight]];

    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:indexpath.row inSection:0];  //你需要更新的组数中的cell
    
    [_dataTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark -------------------tableViewDelegate--------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSNumber *indexNum = [NSNumber numberWithInteger:indexPath.row];
    
    if ([_cellIndex containsObject:indexNum ]){
        //可点击的
           XYJodClickCell *cell =  [XYJodClickCell cellWithTableView:tableView ForIndexPath:indexPath];
         [cell updateCellWith:(XYClickCellModel *)_clickCellDataList[indexPath.row]];
        return cell;

    }else{
        
        //4.可输入的
//        XYWelfareCell *cell =  [XYWelfareCell cellWithTableView:tableView ForIndexPath:indexPath delegate:self];
//        [cell updateCellWith:(XYClickCellModel *)_clickCellDataList[indexPath.row]];
//        return cell;
        //5.
//        NSString *identifier = [XYWelfareCell getCellIdentifier];
        NSString *identifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];

        XYWelfareCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//          XYWelfareCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        NSLog(@"currentRow___%ld",(long)indexPath.row);

        if (cell == nil) {
            cell = [XYWelfareCell cellWithTableView:tableView ForIndexPath:indexPath delegate:self];
            
        }
        
        [cell updateCellWith:(XYClickCellModel *)_clickCellDataList[indexPath.row]];
        
        return cell;
        
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 15;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"row ____%ld____height____%lf",(long)indexPath.row,[_cellHeightList[indexPath.row] floatValue]);
    
    return [_cellHeightList[indexPath.row] floatValue];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 1){
       
        ThreeViewController *vc = [ThreeViewController new];
        vc.littleBlock = ^(NSString *test) {
            
            XYClickCellModel *newCellModel = (XYClickCellModel *)_clickCellDataList[1];
            newCellModel.detailRequire = test;
            
            //修改数据源
            [_clickCellDataList replaceObjectAtIndex:1 withObject:newCellModel];
         
            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:0];  //你需要更新的组数中的cell
            
            [_dataTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
            
        };
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
