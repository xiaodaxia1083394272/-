//
//  LineLayout.m
//  BaiduMapTest
//
//  Created by 123 on 2017/7/6.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "LineLayout.h"

@implementation LineLayout

- (void)prepareLayout//2
{
    [super prepareLayout];
    
    // 水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置内边距
//    CGFloat inset = (self.collectionView.frame.size.width - self.itemSize.width) * 0.5;
//    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);
//    self.sectionInset = UIEdgeInsetsMake(0, 15, 30, 15);
    
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect//3
{
    // 获得super已经计算好的布局属性
    //todo布局为什么用数组来装呢？因为每个cell都有UICollectionViewLayoutAttributes对象，所以，要遍历出来改
    NSArray *elementsArray = [super layoutAttributesForElementsInRect:rect];
    
    // 计算collectionView最中心点的x值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    NSLog(@"contentOffset的x_______%lf",self.collectionView.contentOffset.x);
    NSLog(@"collectionViewCenterX____%lf",centerX);
    
    //在原有布局属性的基础上，进行微调
    for (int i = 0;i<elementsArray.count;i++){
        
        UICollectionViewLayoutAttributes *atts = elementsArray[i];
        // cell的中心点x 和 collectionView最中心点的x值 的间距
        CGFloat delta = ABS(atts.center.x - centerX);
        //todo在算比例的过程中，0是一个很特殊位置的，一般用来处理目标位置
        /*todo3,cell的UICollectionViewLayoutAttributes对象坐标原点是以内容的contentsize的原点为原点的，导致了
         如果要算该cell与collectionview的中点的差值时，collectionView的中点被迫加上偏移值
         */
        //根据间距值计算cell的缩放比例
        CGFloat scale = 1 - delta/self.collectionView.frame.size.width;
        
        NSLog(@"cell,atts.center.x____%lf,____delta___%lf,____scale____%lf",atts.center.x,delta,scale
              
              );
        
        //设置缩放比例
        atts.transform = CGAffineTransformMakeScale(scale, scale);
        
    }

    
    
    return elementsArray;
}


/**
 *  这个方法的特点是：当collectionView的显示范围发生改变的时候，判断是否需要重新刷新布局
 *  一旦重新刷新布局，就重新调用下面的方法:
 1.prepareLayout
 2.layoutAttibutesForElementsInrect:
 *
 *  @return 默认是NO
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds//1
{
    
    
    
    return YES;
}


@end
