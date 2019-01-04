//
//  PTHomeVC.m
//  ProjectKit
//
//  Created by Macx on 2018/1/8.
//  Copyright © 2018年 Low-Key. All rights reserved.
//

#import "PTHomeVC.h"
#import "PTOftenUseAddressCell.h"


@interface PTHomeVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *searchList;
@property (nonatomic,assign) NSInteger pageIndex;
@property (nonatomic,strong) UITextField *searchTF;

@property (nonatomic,strong) NSArray *dataList;
@property (nonatomic,strong) UIButton *clockBtn;
@property (nonatomic,assign) BOOL showFireworksNot;
@property (nonatomic,assign) BOOL isCloseFireworks;
@end

/*
 参考的项目:
 1.工具项目：bigshow：https://github.com/BigShow1949/BigShow1949
 
 */

@implementation PTHomeVC

static NSString *const cellId = @"PTOftenUseAddressCell";
#define pageSizeN 20

- (NSArray *)dataList{
    if (!_dataList){
        _dataList = @[
                      @{@"倒计时":@"PKTimeVC"},
                      @{@"仿微博":@"PKWeiBoVC"},
                      @{@"富文本":@"PKAttributedStringVC"},/*,
                      @{@"预测未来":@""}*/];//pss_屏蔽
    }
    NSLog(@"已存在的模块____%d",_dataList.count);
    return _dataList;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_searchTF resignFirstResponder];
    NSDictionary * aimDic = self.searchList[indexPath.row];
    NSString *aimStr = aimDic.allKeys.firstObject;
    UIViewController *fvc = nil;
    if (!aimStr) return;
    
    NSString *className = aimDic.allValues.firstObject;

    fvc = [NSClassFromString(className) new];
    if (fvc){
        
        [self.navigationController pushViewController:fvc animated:YES];

    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *a = @{}.mutableCopy;
    [a setValue:nil forKey:@"status"];
    [a objectForKey:@"sta"];
    NSString *b = [a objectForKey:@"status"];
    
    self.view.backgroundColor = kWhiteColor;
    self.view.clipsToBounds = NO;
    
    [self setUpUI];
}

- (void)dealloc{
    [kNoteCenter removeObserver:self];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
}



- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
}

- (NSMutableArray *)searchList{
    if (!_searchList){
        _searchList = self.dataList.mutableCopy;
    }
    return _searchList;
}

//MARK:UI
- (void)setUpUI{
    _searchTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, kScreenW - kFitW(30), kFitH(20))];
    _searchTF.placeholder = @"搜索关键字";
    _searchTF.textColor = kWhiteColor;
    [_searchTF setValue:kWhiteColor forKeyPath:@"_placeholderLabel.textColor"];
    _searchTF.delegate = self;
    _searchTF.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = _searchTF;
    
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kFitW(50), kFitW(30))];
    leftBtn.titleLabel.font = kSysFont(15);
    UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBarBtn;
    
    _clockBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kFitW(50), kFitW(30))];
    [_clockBtn addTarget:self action:@selector(clickCloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    _clockBtn.titleLabel.font = kSysFont(15);
    [_clockBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [_clockBtn setTitle:@"开启" forState:UIControlStateSelected];
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:_clockBtn];
    self.navigationItem.rightBarButtonItem = barBtn;
    
    
    [self.view addSubview:self.tableView];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"endText___%@___lengt___%lu",textField.text,textField.text.length);
    [self.view endEditing:YES];
    if (textField.text.length == 0){
       
        self.searchList = self.dataList.mutableCopy;
        [_tableView reloadData];
    }else{
        [self searchAimStr:textField.text];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSLog(@"continueText___%@___lengt___%lu",textField.text,textField.text.length);
    if ([string isEqualToString:@"\n"]){
        [textField resignFirstResponder];
        return NO ;

    }
    
    
    SHLog(@"测试");
    [self searchAimStr:string];
    return YES;
}

- (void)searchAimStr:(NSString *)string{
    [self.searchList removeAllObjects];
    for(NSDictionary * temp in self.dataList){
        
        if ([temp.allKeys.firstObject containsString:string]){
            [self.searchList addObject:temp];
        }
    }
    [self.tableView reloadData];
    
}


- (UITableView *)tableView{
    if (!_tableView){
        //
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH-kTopH) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = kRedColor;
        _tableView.clipsToBounds = NO;
        [_tableView registerClass:[PTOftenUseAddressCell class] forCellReuseIdentifier:cellId];
 
        
    }
    return _tableView;
}

#pragma mark UITableViewDelegate UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchList.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PTOftenUseAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    NSDictionary *dataDic = self.searchList[indexPath.row];
    
    cell.sendAddressLB.text = [NSString stringWithFormat:@"%d.%@",indexPath.row,dataDic.allKeys.firstObject];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//添加箭头
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return kFitH(60);
    
}

@end
