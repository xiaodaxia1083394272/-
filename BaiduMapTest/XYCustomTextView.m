//
//  XYCustomTextView.m
//  BaiduMapTest
//
//  Created by 123 on 2017/7/24.
//  Copyright © 2017年 HMRL. All rights reserved.
//

#import "XYCustomTextView.h"

@interface XYCustomTextView()<UITextViewDelegate>

@property(strong, nonatomic) UILabel *textViewPlaceholderLabel;

@end

@implementation XYCustomTextView

#define baseLineHeight 40


- (instancetype)initWithFrame:(CGRect)frame

{
    
    if (self = [super initWithFrame:frame]) {

        self.font = [UIFont systemFontOfSize:14];
        self.textAlignment = NSTextAlignmentRight;
        //placeHolderLabel
        _textViewPlaceholderLabel = [UILabel new];
        _textViewPlaceholderLabel.font = [UIFont systemFontOfSize:14];
        _textViewPlaceholderLabel.textAlignment = NSTextAlignmentRight;
        _textViewPlaceholderLabel.textColor = [UIColor lightGrayColor];
        _textViewPlaceholderLabel.text = @"提示文字";
        self.delegate = self;
        [self addSubview:_textViewPlaceholderLabel];

        
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _textViewPlaceholderLabel.frame = self.bounds;
    
}

- (void)updateDescribeHeightWithDescribe:(NSString *)describe{
    
    _textViewPlaceholderLabel.hidden = YES;

    self.text = describe;
    
    float height = [self heightForTextView:self WithText:describe];
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, height);

    
}

#pragma mark ------------------重写delegate------------

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    NSLog(@"___");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    NSLog(@"subView__text___%@",text);
    CGRect frame = textView.frame;
    
    _textViewPlaceholderLabel.hidden = YES;
    
    if (range.length == 0 && range.location == 0){
        
        _textViewPlaceholderLabel.hidden = NO;

    }
    
    float height;
    if ([text isEqual:@""]) {
        

        
        if (![textView.text isEqualToString:@""]) {
            
            height = [ self heightForTextView:textView WithText:[textView.text substringToIndex:[textView.text length] - 1]];
            
        }else{
            
            height = [ self heightForTextView:textView WithText:textView.text];
        }
    }else{
        
        
        height = [self heightForTextView:textView WithText:[NSString stringWithFormat:@"%@%@",textView.text,text]];
    }
    
    frame.size.height = height;
    [UIView animateWithDuration:0.5 animations:^{
        
        textView.frame = frame;
        
    } completion:nil];
    
    if ([_customTextViewDelegate respondsToSelector:@selector(customTextViewNewHeight:)]){
        
        [_customTextViewDelegate customTextViewNewHeight:height];
    }
    
    return YES;
}

- (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText{
    CGSize constraint = CGSizeMake(textView.contentSize.width , CGFLOAT_MAX);
    CGRect size = [strText boundingRectWithSize:constraint
                                        options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                     attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}
                                        context:nil];
    float textHeight = size.size.height + 10.0;
    //最小值
    if (textHeight < baseLineHeight){
        textHeight = baseLineHeight;
    }
    return textHeight;
}


@end
