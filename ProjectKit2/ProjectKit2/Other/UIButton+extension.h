//
//  UIButton+extension.h
//  OrderSys
//
//  Created by Macx on 2017/7/6.
//  Copyright © 2017年 com.hx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};
@interface UIButton (extension)
+(instancetype)hf_buttonNoImageWithFrame:(CGRect)frame
                                   title:(NSString *)title
                              titleColor:(UIColor *)titleColor
                            titleHlColor:(UIColor *)titleHlColor
                                 bgColor:(UIColor *)bgColor
                                    font:(UIFont*)font
                                  target:(id)target
                                  action:(SEL)action;

-(instancetype)hf_buttonNoImageWithTitle:(NSString *)title
                              titleColor:(UIColor *)titleColor
                            titleHlColor:(UIColor *)titleHlColor
                                 bgColor:(UIColor *)bgColor
                                    font:(UIFont*)font
                                  target:(id)target
                                  action:(SEL)action;

+(instancetype)hf_buttonNoImageWithFrame:(CGRect)frame
                                   title:(NSString *)title
                              titleColor:(UIColor *)titleColor
                       titleDisableColor:(UIColor *)titleDisableColor
                                 bgColor:(UIColor *)bgColor
                                    font:(UIFont *)font
                                  target:(id)target
                                  action:(SEL)action;

+(instancetype)hf_buttonImageWithFrame:(CGRect )frame
                                 title:(NSString *)title
                            titleColor:(UIColor *)titleColor
                              imageStr:(NSString *)imageStr
                          titleHlColor:(UIColor *)titleHlColor
                               bgColor:(UIColor *)bgColor
                              fontSize:(CGFloat)fontSize
                                target:(id)target
                                action:(SEL)action;
/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)hf_setBackgroundColor:(UIColor *)backgroundColor
                     forState:(UIControlState)state;
@end

@interface UIButton (layout)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)hf_layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

- (void)hf_setBackgroundImageByName:(NSString*)imageName;

- (void)hf_setProperty:(UIColor *)backgroundColor
             textColor:(UIColor *)textColor
                  font:(CGFloat)font
                 title:(NSString *)title
         textAlignment:(NSTextAlignment)textAlignment;

@end

/** xlExtention */

@interface UIButton (xlConvenience)
/**
 normalStateTitle 
 */
@property(nonatomic,copy) NSString * xl_normalTitle;
/**
   the color of the button CurrentTitle 
   the state for normal selected & highlight
 */
@property (nonatomic)UIColor *xl_normalColor;
@property (nonatomic)UIColor *xl_selectedColor;
@property (nonatomic)UIColor *xl_hightColor;

/** Convenience func" return a normalType button(by the system)*/
+(instancetype)xl_customButton;

-(void)xl_setNormalImage:(NSString *)image;
-(void)xl_setHighlightedImage:(NSString *)image;
-(void)xl_setSelectedImage:(NSString *)image;
-(void)xl_addSingleTouchedTarget:(id)target action:(SEL)action;

/** expand the  respose area*/
/** 按钮扩大点击区域 中心点不变 四周扩张xl_expandLength的距离 */
@property (nonatomic,assign)CGFloat xl_expandLength;

@end
