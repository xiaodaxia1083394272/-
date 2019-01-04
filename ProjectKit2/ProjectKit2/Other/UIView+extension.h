//
//  UIView+Frame.h
//  传智微博
//
//  Created by apple on 15-3-5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/message.h> 

@interface UIView (extension)
// 分类不能添加成员属性
// @property如果在分类里面，只会自动生成get,set方法的声明，不会生成成员属性，和方法的实现
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


/**
 *  9.上
 */
@property (nonatomic) CGFloat top;

/**
 *  10.下
 */
@property (nonatomic) CGFloat bottom;

/**
 *  11.左
 */
@property (nonatomic) CGFloat left;

/**
 *  12.右
 */
@property (nonatomic) CGFloat right;


- (void)addTarget:(id)target
           action:(SEL)action;
/*
 @param radius 圆角半径
 */
- (void)viewWithRadius:(CGSize)radius;
/*
@param radius 圆角半径 边框宽度 边的颜色
*/
- (void)viewWithRadius:(CGSize)radius color:(UIColor *)color width:(CGFloat)width;
/*
 * 判断一个控件是否真正显示在主窗口
 */
- (BOOL)isShowingOnKeyWindow;

/**
 *  1.添加边框
 *
 *  @param color 边框颜色，宽度，圆角半径
 */
- (void)addBorderColor:(UIColor *)color borderWidth:(CGFloat)borderwidth cornerRadius:(CGFloat)cornerRadius;


/**
 *  1.添加边框
 *
 *  @param color 边框颜色，宽度
 */
- (void)addBorderColor:(UIColor *)color borderWidth:(CGFloat)borderwidth;




- (UIViewController*)viewController;//获取当前视图所在的父视图

- (UIViewController *)topViewController;//获取最前面的控制器
//分割线
+(UIView *)LineWithFrame :(CGRect)frame bgColor:(UIColor*)bgColor;


#pragma mark *****是否添加背景图片*****
-(void)setBgImageViewWithOrNot:(BOOL)orNot imageStr:(NSString*)imageStr;
@end

@interface UIView (xlExtention)
/** 右上角提示文字 */
@property (nonatomic,copy)NSString *xl_badgeString;
/** 提示数字 (正整数)*/
@property (nonatomic,assign)NSUInteger xl_badgeNumber;
/** 设置view的约束 */
-(void)xlLayoutMakeWithSuperView:(UIView *)superview;
/** 把view的 frame 转换为 int值 可以解决视图模糊的问题 (retina 就是牛)*/
-(void)xl_changeFrameToInteger;
/** 菊花 */
@property(nonatomic,weak)UIActivityIndicatorView *xl_ActivityView;
@end


@interface UIView (xlResloveInstanceMethod)

@end
