//
//  TwoViewController.m
//  BaiduMapTest
//
//  Created by HMRL on 17/5/18.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "CZRDropDownMenuCell.h"


@interface TwoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,weak) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation TwoViewController

static NSString * const czrID = @"cell";

- (instancetype)initCompletion:(void(^)(NSString *))testBlock{
    
    self = [super init];
    if (self) {
        
        _littleBlock = testBlock;
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _dataArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16"];
    
    [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        // 布局
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _layout = layout;
        
        // collectionView的item大小
        
        CGFloat itemW = 30;
        CGFloat itemH = 20;
        
        _layout.itemSize = CGSizeMake(itemW, itemH);
        //    _layout.minimumInteritemSpacing = 10;
        _layout.sectionInset = UIEdgeInsetsMake(5, 10, 10, 10);
        
        
        
        // 创建collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 200, 200, 300) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor yellowColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[CZRDropDownMenuCell class] forCellWithReuseIdentifier:czrID];
        
    }
    return _collectionView;
}


- (IBAction)clickTestButton:(id)sender {
    
    
    ThreeViewController *vc = [ThreeViewController new];
    vc.littleBlock = ^(NSString *test) {
      
            if(_littleBlock != nil) {
        
                _littleBlock(test);
            }
    };
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CZRDropDownMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:czrID forIndexPath:indexPath];
    
    NSString *model = self.dataArray[indexPath.row];
    
    cell.titleLabel.text = model;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 再执行一次 按钮点击方法
//    [self menuBtnAction:_menuBtn];
    
    // 告诉代理选中了item
//    if ([self.delegate respondsToSelector:@selector(dropDownMenuWithDidSelectedItem:index:)]) {
//        
//        [self.delegate dropDownMenuWithDidSelectedItem:self index:indexPath.row];
//    }
}



@end
