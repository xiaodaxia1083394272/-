//
//  CollectionViewTestVC.m
//  BaiduMapTest
//
//  Created by 123 on 2017/7/5.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "CollectionViewTestVC.h"
#import "CollectionCell.h"
#import "LineLayout.h"

@interface CollectionViewTestVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *imageNames;


@end

@implementation CollectionViewTestVC
static NSString *identifier = @"firstCell";


- (NSMutableArray *)imageNames
{
    if (!_imageNames) {
        _imageNames = [NSMutableArray array];
        for (int i = 0; i<20; i++) {
            [_imageNames addObject:[NSString stringWithFormat:@"%d.jpg", i + 1]];
        }
    }
    return _imageNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:self.collectionView];
}

- (UICollectionView *)collectionView
{
    __weak typeof(self)weakSelf = self;
    if (!_collectionView) {
        // 布局,直接实例一个出来就
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
//        _layout = layout;

        // 创建collectionView
//        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,weakSelf.view.frame.size.width , weakSelf.view.frame.size.height - 64) collectionViewLayout:layout];
        //替换新的布局
        LineLayout *layout = [LineLayout new];
        layout.itemSize = CGSizeMake(100, 100);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100,weakSelf.view.frame.size.width ,/* weakSelf.view.frame.size.height - 64*/120) collectionViewLayout:layout];

        
        _collectionView.backgroundColor = [UIColor blackColor];
        _collectionView.delegate = weakSelf;
        _collectionView.dataSource = weakSelf;
        //todo注册
        [_collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:identifier];
        
    }
    return _collectionView;
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageNames.count;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSString *a = self.imageNames[indexPath.item];
    cell.titleLabel.image = [UIImage imageNamed:a];
    return cell;
}




#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.imageNames removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}



@end
