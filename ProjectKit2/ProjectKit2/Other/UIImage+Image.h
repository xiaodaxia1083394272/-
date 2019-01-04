//
//  UIImage+Image.h
//  传智微博
//
//  Created by apple on 15-3-4.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImage (Image)

//生成图片
-(UIImage *)hf_image;
//画圆
-(UIImage *)hf_circleImage;
// 加载最原始的图片，没有渲染
// instancetype默认会识别当前是哪个类或者对象调用，就会转换成对应的类的对象
// UIImage *

// 加载最原始的图片，没有渲染
+ (instancetype)hf_imageWithOriginalName:(NSString *)imageName;

+ (instancetype)hf_imageWithStretchableName:(NSString *)imageName;

+ (UIImage *)hf_circleImageName:(NSString *)path borderWith:(double)border colorWith:(UIColor *)color;
- (UIImage *)hf_circleImageName:(NSString *)path borderWith:(double)border colorWith:(UIColor *)color;
//颜色转化图片
+(UIImage *)hf_imageWithColor:(UIColor *)color;

- (UIImage*)hf_imageRotatedByDegrees:(CGFloat)degrees;
@end
