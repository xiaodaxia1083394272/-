//
//  UIButton+extension.m
//  OrderSys
//
//  Created by Macx on 2017/7/6.
//  Copyright © 2017年 com.hx. All rights reserved.
//

#import "UIButton+extension.h"

@implementation UIButton (extension)


+(instancetype)hf_buttonNoImageWithFrame:(CGRect)frame title:(NSString *)title  titleColor:(UIColor *)titleColor titleHlColor:(UIColor *)titleHlColor bgColor:(UIColor *)bgColor  font:(UIFont *)font target:(id)target action:(SEL)action{
    UIButton *btn = [[self alloc]initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:titleHlColor forState:UIControlStateHighlighted];
    [btn setBackgroundColor:bgColor];
    
    btn.titleLabel.font = font;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return btn;
}
-(instancetype)hf_buttonNoImageWithTitle:(NSString *)title  titleColor:(UIColor *)titleColor titleHlColor:(UIColor *)titleHlColor bgColor:(UIColor *)bgColor  font:(UIFont *)font target:(id)target action:(SEL)action
{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:titleColor forState:UIControlStateNormal];
    [self setTitleColor:titleHlColor forState:UIControlStateHighlighted];
    [self setBackgroundColor:bgColor];
    self.titleLabel.font = font;
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}
+(instancetype)hf_buttonNoImageWithFrame:(CGRect)frame title:(NSString *)title  titleColor:(UIColor *)titleColor titleDisableColor:(UIColor *)titleDisableColor bgColor:(UIColor *)bgColor  font:(UIFont *)font target:(id)target action:(SEL)action{
    UIButton *btn = [[self alloc]initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setTitleColor:titleDisableColor forState:UIControlStateDisabled];
    [btn setBackgroundColor:bgColor];
   
    btn.titleLabel.font = font;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return btn;
}
+(instancetype)hf_buttonImageWithFrame:(CGRect )frame title:(NSString *)title  titleColor:(UIColor *)titleColor imageStr:(NSString *)imageStr titleHlColor:(UIColor *)titleHlColor bgColor:(UIColor *)bgColor  fontSize:(CGFloat)fontSize target:(id)target action:(SEL)action{
    
    UIButton *btn = [[self alloc]initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn setBackgroundColor:bgColor];
    [btn setImage:kImage(imageStr) forState:UIControlStateNormal];
    btn.titleLabel.font = kSysFont(kFitW(fontSize));
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
    
}
/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)hf_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:[UIButton hf_imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)hf_imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
@end
@implementation UIButton (layout)

- (void)hf_layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)spacing
{
    //1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case MKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-spacing/2.0+4, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-spacing/2.0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2.0, 0, spacing/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, spacing/2.0, 0, -spacing/2.0);
        }
            break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-spacing/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-spacing/2.0, -imageWith, 0, 0);
        }
            break;
        case MKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+spacing/2.0, 0, -labelWidth-spacing/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-spacing/2.0, 0, imageWith+spacing/2.0);
        }
            break;
        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
    
}
- (void)hf_setBackgroundImage:(UIImage*)image
{
    CGRect rect;
    rect = self.frame;
    rect.size = image.size; // set button size as image size
    self.frame = rect;
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)hf_setBackgroundImageByName:(NSString*)imageName
{
    [self hf_setBackgroundImage:[UIImage imageNamed:imageName]];
}

- (void)hf_setProperty:(UIColor *)backgroundColor textColor:(UIColor *)textColor font:(CGFloat)font title:(NSString *)title textAlignment:(NSTextAlignment)textAlignment{
    if (backgroundColor != nil) {
        self.backgroundColor = backgroundColor;
    }
    
    if (title != nil) {
        [self setTitle:title forState:UIControlStateNormal];
        self.titleLabel.textAlignment = textAlignment;
    }
    
    if (textColor != nil) {
        [self setTitleColor:textColor forState:UIControlStateNormal];
    }
    
    if (font > 0) {
        self.titleLabel.font = [UIFont systemFontOfSize:font];
    }
    
}

@end


@implementation UIButton (xlConvenience)

-(void)xl_setNormalImage:(NSString *)image
{
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
}
-(void)xl_setHighlightedImage:(NSString *)image
{
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
}
-(void)xl_setSelectedImage:(NSString *)image
{
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateSelected];
}
-(void)xl_addSingleTouchedTarget:(id)target action:(SEL)action
{
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
+(instancetype)xl_customButton
{
    return [self buttonWithType:UIButtonTypeCustom];
}
-(void)setXl_normalColor:(UIColor *)xl_normalColor
{
    [self setTitleColor:xl_normalColor forState:UIControlStateNormal];
}
-(void)setXl_hightColor:(UIColor *)xl_hightColor
{
    [self setTitleColor:xl_hightColor forState:UIControlStateHighlighted];
}
-(void)setXl_normalTitle:(NSString *)xl_normalTitle
{
    [self setTitle:xl_normalTitle forState:UIControlStateNormal];
}
-(void)setXl_selectedColor:(UIColor *)xl_selectedColor
{
    [self setTitleColor:xl_selectedColor forState:UIControlStateSelected];
}
-(UIColor *)xl_selectedColor
{
    return [self titleColorForState:UIControlStateSelected];
}
-(UIColor *)xl_normalColor
{
    return [self titleColorForState:UIControlStateNormal];
}
-(UIColor *)xl_hightColor
{
    return [self titleColorForState:UIControlStateHighlighted];
}
-(NSString *)xl_normalTitle
{
    return [self titleForState:UIControlStateNormal];
}
/** */
static char expandSizeKey = 'e';

-(void)setXl_expandLength:(CGFloat)xl_expandLength{
     objc_setAssociatedObject(self, &expandSizeKey, [NSNumber numberWithFloat:xl_expandLength], OBJC_ASSOCIATION_COPY_NONATOMIC);
}
-(CGFloat)xl_expandLength{
   return  [objc_getAssociatedObject(self, &expandSizeKey) floatValue];
}

//获取设置的扩大size，来扩大button的rect
- (CGRect)expandRect {
    
    CGFloat expandSize = self.xl_expandLength;
    if (expandSize) {
        return CGRectMake(self.bounds.origin.x - expandSize,
                          self.bounds.origin.y - expandSize,
                          self.bounds.size.width + expandSize * 2,
                          self.bounds.size.height + expandSize *2);
    } else {
        return self.bounds;
    }
}

//响应用户的点击事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    
    CGRect buttonRect = [self expandRect];
    if (CGRectEqualToRect(buttonRect, self.bounds)) {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(buttonRect, point) ? YES : NO;
}
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGRect buttonRect = [self expandRect];
    if (CGRectEqualToRect(buttonRect, self.bounds))
    {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(buttonRect, point) ? self : nil;
}
@end
