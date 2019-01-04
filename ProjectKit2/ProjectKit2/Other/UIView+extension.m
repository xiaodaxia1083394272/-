//
//  UIView+Frame.m

//
//  Created by apple on 15-3-5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIView+extension.h"

@implementation UIView (extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}
//底部
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


- (void)addTarget:(id)target
           action:(SEL)action;
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:target
                                                                         action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}
- (void)addBorderColor:(UIColor *)color borderWidth:(CGFloat)borderwidth cornerRadius:(CGFloat)cornerRadius {
    if (color) {
        [self.layer setBorderColor:color.CGColor];
    }
    if (borderwidth !=0) {
        [self.layer setBorderWidth:borderwidth];
    }
    
    if (cornerRadius  != 0) {
        [self.layer setCornerRadius:cornerRadius];
    }
    
}
- (UIViewController*)viewController {
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}


- (void)addBorderColor:(UIColor *)color borderWidth:(CGFloat)borderwidth
{
    [self addBorderColor:color borderWidth:borderwidth cornerRadius:0];
}

- (BOOL)isShowingOnKeyWindow
{
    // 主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    // 以主窗口左上角为坐标原点, 计算self的矩形框
    CGRect newFrame = [keyWindow convertRect:self.frame fromView:self.superview];
    CGRect winBounds = keyWindow.bounds;
    
    // 主窗口的bounds 和 self的矩形框 是否有重叠
    BOOL intersects = CGRectIntersectsRect(newFrame, winBounds);
    
    return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects;
}
-(void)viewWithRadius:(CGSize)radius{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:radius];
    CAShapeLayer *masklayer = [CAShapeLayer new];
    masklayer.frame = self.bounds;
    masklayer.path = maskPath.CGPath;
    self.layer.mask = masklayer;
    
//    view.layer.cornerRadius = 5;//或者写view.layer.masksToBounds = YES;
//    view.clipsToBounds = YES;
    
    
}
-(void)viewWithRadius:(CGSize)radius color:(UIColor *)color width:(CGFloat)width{

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:radius];
    CAShapeLayer *masklayer = [CAShapeLayer new];
    masklayer.frame = self.bounds;
    masklayer.path = maskPath.CGPath;
    self.layer.mask = masklayer;
    
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;

}

+(UIView *)LineWithFrame :(CGRect)frame bgColor:(UIColor*)bgColor{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    
    line.backgroundColor = bgColor;
    
    return line;
}

#pragma mark *****是否添加背景图片*****
-(void)setBgImageViewWithOrNot:(BOOL)orNot imageStr:(NSString*)imageStr{
    //imageWithContentsOfFile则仅只加载图片,不缓存
    
    if (orNot==NO) {
        NSMutableArray *subviewArr = (NSMutableArray*)self.subviews ;
        for (int i = 0; i<subviewArr.count; i++) {
            UIImageView *view =subviewArr[i];
            if ([view isKindOfClass:[UIImageView class]] &&(view.tag==10000)) {
                UIImageView *imageV = subviewArr[i];
                [imageV removeFromSuperview];
                imageV = nil;
                continue;
                
            }
        }
        
        
    }else{
        
        
        UIImageView *bgImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageStr]];
        bgImageV.size = CGSizeMake(kFitW(200), kFitW(200));
    
     bgImageV.center =CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
        
        bgImageV.tag = 10000;
        [self addSubview:bgImageV];
        
    }
    
}
@end

static NSString * const xl_badgeValueKey = @"xl_badgeValueKey";
static NSString * const xl_badgeValueButtonKey = @"xl_badgeValueButtonKey";

#define xl_badgeValue_height  (kFitW(kStatusSpace?20.f:17.f))


@interface UIView()

@property (nonatomic)UIButton * xl_badgeValueButton;

@end

@implementation UIView(xlExtention)

-(void)setXl_badgeString:(NSString *)xl_badgeString{
    
    objc_setAssociatedObject(self, (__bridge const void *)(xl_badgeValueKey), xl_badgeString, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    if (!xl_badgeString.length || ([self xl_isAllNumber:xl_badgeString] && xl_badgeString.integerValue <= 0)) {
        [self.xl_badgeValueButton removeFromSuperview];
        self.xl_badgeValueButton = nil;
    }
    else{
        CGRect rect = [self.xl_badgeString  boundingRectWithSize:CGSizeMake(MAXFLOAT, xl_badgeValue_height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:[UIFont smallSystemFontSize]]} context:nil];
        // 创建红点
        kWeakSelf(self);
        CGFloat width = rect.size.width + 10.f > xl_badgeValue_height ? rect.size.width + 10.f : xl_badgeValue_height;
        CGFloat offsetY = xl_badgeValue_height * 0.2f;
        CGFloat offsetX = xl_badgeValue_height * 0.5f + offsetY;
        [self.xl_badgeValueButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(weakself.mas_right).offset(-offsetX);
            make.centerY.mas_equalTo(weakself.mas_top).offset(offsetY);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(xl_badgeValue_height);
        }];
        [self layoutIfNeeded];
        [self.xl_badgeValueButton setTitle:xl_badgeString forState:UIControlStateNormal];
    }
}
    

-(void)setXl_badgeValueButton:(UIButton *)xl_badgeValueButton{
    objc_setAssociatedObject(self, (__bridge const void *)(xl_badgeValueButtonKey), xl_badgeValueButton, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UIButton *)xl_badgeValueButton{
    
  UIButton * badgeButton =  objc_getAssociatedObject(self, (__bridge const void *)(xl_badgeValueButtonKey));
    if (!badgeButton) {
        badgeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        badgeButton.layer.cornerRadius = xl_badgeValue_height / 2;
        badgeButton.layer.masksToBounds = YES;
        badgeButton.titleLabel.font = [UIFont systemFontOfSize:[UIFont smallSystemFontSize]];
        badgeButton.backgroundColor = RGBColor(231, 39, 45);
        self.xl_badgeValueButton = badgeButton;
        [self addSubview:badgeButton];
    }
    return badgeButton;
}
-(NSString *)xl_badgeString{
    
    return objc_getAssociatedObject(self, (__bridge const void *)xl_badgeValueKey);
}
// 判断是否全是数字
- (BOOL)xl_isAllNumber:(NSString *)text{
    unichar str;
    for (NSInteger index = 0; index < text.length; index ++) {
        str = [text characterAtIndex:index];
        if (isdigit(str)) {
            return YES;
        }
    }
    return NO;
}
-(void)setXl_badgeNumber:(NSUInteger)xl_badgeNumber{
    
    self.xl_badgeString = xl_badgeNumber > 999?@"999+":[NSString stringWithFormat:@"%lu",xl_badgeNumber];
}
-(NSUInteger)xl_badgeNumber{
    
    return [self.xl_badgeString integerValue];
}
-(void)xlLayoutMakeWithSuperView:(UIView *)superview{}

-(void)xl_changeFrameToInteger{
    CGRect frame = self.frame;
    
    int x = floor(frame.origin.x);
    int y = floor(frame.origin.y);
    int w = floor(frame.size.width)+1;
    int h = floor(frame.size.height)+1;
    
    self.frame = CGRectMake(x, y, w, h);
}
static const char xl_ActivityViewKey = 'a';


-(void)setXl_ActivityView:(UIActivityIndicatorView *)xl_ActivityView{

    objc_setAssociatedObject(self, &xl_ActivityViewKey, xl_ActivityView, OBJC_ASSOCIATION_ASSIGN);
}

-(UIActivityIndicatorView *)xl_ActivityView{
    
    UIActivityIndicatorView * activityView = objc_getAssociatedObject(self, &xl_ActivityViewKey);
    if (!activityView) {
        activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityView.backgroundColor = self.backgroundColor;
        [self addSubview:activityView];
        [activityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0.f, 0.f, 0.f, 0.f));
        }];
        self.xl_ActivityView = activityView;
    }
    
    return activityView;
}
//-(void)DrawsWithVibrantLightMode:(id)param{
//    NSLog(@"%@",param);
//};
/** */
@end


@implementation UIView (xlResloveInstanceMethod)
+(void)load{
    static dispatch_once_t onceToken;
    //解决一个bug ipad上运行 [UIView setDrawsWithVibrantLightMode:] 报错 目前未定位到具体报错行
    dispatch_once(&onceToken, ^{
        class_addMethod(self,
                        NSSelectorFromString(@"setDrawsWithVibrantLightMode:"),class_getMethodImplementation(self, @selector(resloveSetDrawsWithVibrantLightMode:)),"v@:@");
    });
}
-(void)resloveSetDrawsWithVibrantLightMode:(id)param{};

@end
