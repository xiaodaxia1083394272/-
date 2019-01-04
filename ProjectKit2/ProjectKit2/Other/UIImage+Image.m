//
//  UIImage+Image.m
//  传智微博
//
//  Created by apple on 15-3-4.
//  Copyright (c) 2012年 itcast. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)


//保持原来大小
+ (instancetype)hf_imageWithOriginalName:(NSString *)imageName
{
   UIImage *image = [UIImage imageNamed:imageName];
    if (image==nil) {
        image = [UIImage imageWithContentsOfFile:imageName];
    }
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


+ (instancetype)hf_imageWithStretchableName:(NSString *)imageName
{
   UIImage *image = [UIImage imageNamed:imageName];
    if (image==nil) {
        image = [UIImage imageWithContentsOfFile:imageName];
    }
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

-(UIImage *)hf_image{
    // NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0.0);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
     CGContextAddRect(ctx, rect);
    // 将图片画上去
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
- (UIImage *)hf_circleImage {
    
    // NO代表透明 开启图片下文
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
   CGFloat radius=rect.size.height>=rect.size.width?(rect.size.width):(rect.size.height);
    
    radius/=2;
    CGFloat centerX=rect.size.width/2;
    CGFloat centerY=rect.size.height/2;
    CGContextAddArc(ctx, centerX, centerY, radius, 0, M_PI_2*4, YES);
    // 裁剪
    CGContextClip(ctx);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
     
    // 将图片画上去
   [self drawInRect:rect];
    
    UIGraphicsEndImageContext();
    
    return image;
    
}
//画圆有并圆圈
+ (UIImage *)hf_circleImageName:(NSString *)path borderWith:(double)border colorWith:(UIColor *)color{
   UIImage *img =kImage(path);
  
      UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);
    
    CGContextRef ctr=UIGraphicsGetCurrentContext();

    CGFloat radius=img.size.height>=img.size.width?(img.size.width-2*border):(img.size.height-2*border);

    radius/=2;

    CGFloat centerx=img.size.width/2;
    CGFloat centery=img.size.height/2;


    [color set];
   
    CGContextAddArc(ctr, centerx, centery, radius+border, 0, M_PI_2*4, YES);
    CGContextFillPath(ctr);

    CGContextAddArc(ctr, centerx, centery, radius, 0, M_PI_2*4, YES);

    CGContextClip(ctr);

    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];

    UIImage *newImg=UIGraphicsGetImageFromCurrentImageContext();


    UIGraphicsEndImageContext();
    
    return newImg;

}
-(UIImage *)hf_circleImageName:(NSString *)path borderWith:(double)border colorWith:(UIColor *)color{
   
   
     UIImage *img =kImage(path);
    
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);

    CGContextRef ctr=UIGraphicsGetCurrentContext();

    CGFloat radius=img.size.height>img.size.width?(img.size.width/2):(img.size.height/2);

    radius/=2;


    CGFloat centerx=img.size.width/2;
    CGFloat centery=img.size.height/2;


    [color set];
    //   CGContextSetLineWidth(ctr, border);
    CGContextAddArc(ctr, centerx, centery, radius+border, 0, M_PI_2*4, YES);
    CGContextFillPath(ctr);

    CGContextAddArc(ctr, centerx, centery, radius, 0, M_PI_2*4, YES);

    CGContextClip(ctr);

    [img drawInRect:CGRectMake(0, 0, img.size.width, img.size.height)];

    UIImage *newImg=UIGraphicsGetImageFromCurrentImageContext();


    UIGraphicsEndImageContext();
    
    return newImg;



}
+(UIImage *)hf_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (UIImage*)hf_imageRotatedByDegrees:(CGFloat)degrees{
    CGFloat width = CGImageGetWidth(self.CGImage);
    CGFloat height = CGImageGetHeight(self.CGImage);
    CGSize rotatedSize;
    rotatedSize.width = width;
    rotatedSize.height = height;
    UIGraphicsBeginImageContext(rotatedSize);
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextRotateCTM(bitmap, degrees * M_PI / 180);
    CGContextRotateCTM(bitmap, M_PI);
    CGContextScaleCTM(bitmap, -1.0, 1.0);
    CGContextDrawImage(bitmap, CGRectMake(-rotatedSize.width/2, -rotatedSize.height/2, rotatedSize.width, rotatedSize.height), self.CGImage);
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
