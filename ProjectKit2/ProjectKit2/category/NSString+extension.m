//
//  NSString+extension.m
//  520SHQ
//
//  Created by Macx on 2017/8/17.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import "NSString+extension.h"
#import <CommonCrypto/CommonDigest.h>


@implementation NSString (extension)

- (NSString *)cacheWithPath {
    
    NSString * sandbox = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    
    return [sandbox stringByAppendingPathComponent:self];
}


+ (NSDictionary *)webUrlHandleWithUrlStr:(NSString *)urlStr{
    /*
     http://192.168.1.43:8091/localQuickPurchase/distributionVA/goodsDetail/5ad61f86e4b00f9d617dd83d/5762025/5762025?goodsId=5ad61f86e4b00f9d617dd83d&seq=5762025
     */
    NSString *paramStr = [[urlStr componentsSeparatedByString:@"?"] lastObject];
    
    NSArray *paramList = [paramStr componentsSeparatedByString:@"&"];
    NSMutableDictionary *allParams = @{}.mutableCopy;
    
    for(NSString * one in paramList){
        
        NSArray *paramOneList = [one componentsSeparatedByString:@"="];
        [allParams setValue:paramOneList[1] forKey:paramOneList[0]];
    }
    
    return allParams;
}

//去除字符串前后空格
-(NSString*)hf_trim{
    if (self) {
        //whitespaceAndNewlineCharacterSet 去除前后空格与回车
        //whitespaceCharacterSet 除前后空格
        return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return @"";
}

-(NSString *)hf_trimWhites
{
    if (self) {
        //whitespaceAndNewlineCharacterSet 去除前后空格与回车
        //whitespaceCharacterSet 除前后空格
        return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }
    return @"";
}

/*计算文字高度*/
- (CGFloat)heightWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.height;
}

- (CGFloat)widthWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width+1;
}

- (CGFloat)widthForString:(CGSize)size font:(CGFloat)font{
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    CGFloat w = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size.width;
    return w;
}
//高度
-(CGFloat)hf_widthWithHeight:(CGFloat)height font:(UIFont*)font{
   return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;

}
//宽度
-(CGFloat)hf_heightWithWidth:(CGFloat)width font:(UIFont*)font{
    return [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.height;

}
/*计算文字 宽高 size*/
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (BOOL)isPhoneNo:(NSString *)phone{
    return ([self hf_fixedMobile:phone] || [self hf_validateMobile:phone]);
}
//手机号码
+ (BOOL)hf_validateMobile:(NSString *)mobile
{
    //手机号以13,14,15,18,17开头，八个 \d 数字字符
//    NSString *phoneRegex = @"^1(3[0-9]|4[57]|5[0-35-9]|8[0-345-9]|7[013678])\\d{8}$";
    NSString *phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[012356789]|18[0-9]|14[0-9])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
//固话
+(BOOL)hf_fixedMobile:(NSString *)mobile{
    
    NSString *fixedMobile = @"^(0\\d{2}-\\d{8}(-\\d{1,4})?)|(0\\d{3}-\\d{7,8}(-\\d{1,4})?)$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",fixedMobile];
    return [phoneTest evaluateWithObject:mobile];
}
//邮政号码
+(BOOL)hf_postcodeValidateWithStr:(NSString *)str{
    
    NSString *postStr =@"^\\d{6}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",postStr];
    return [phoneTest evaluateWithObject:str];
    
}
//邮箱正确表达式
+ (BOOL)hf_validateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
//密码
+ (BOOL)hf_validatePassword:(NSString *)passWord
{
    /**
     /^    匹配输入字符串的开始位置
     (
     [A-Za-z0-9]     大小写字母和数字任选
     {6,20}    长度大于5小于20
     )
     $/    匹配输入字符串的结束位置
     */
    NSString *passWordRegex = @"^[A-Za-z0-9]{5,20}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}
//身份证
+ (BOOL)hf_validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate  predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}
//昵称
+ (BOOL)hf_validateNickname:(NSString *)nickname
{
    // NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";//这个是昵称只能为中文的正则判断，长度大于4小于8
    /**
     ^ 以后面的为开头
     $ 以前面的为结尾
     \w 数字，字母，下划线，.
     \u4E00-\u9FA5 中文
     * 代表前面出现0次或多次
     | 或者
     */
    NSString *nicknameRegex = @"^(\\w|-|[\u4E00-\u9FA5])*$";
    //昵称可以是中文、字母、数字、下划线，这里不做字符长度限制
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

//街道楼号
+(BOOL)hf_validateAvenue:(NSString*)avenue{
    NSString *avenueRegex =@"^(\\w|-|[\u4E00-\u9FA5])*$";
    
    NSPredicate *avenuePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",avenueRegex];
    return [avenuePredicate evaluateWithObject:avenue];
}
//银行卡号
+(BOOL)hf_validBankCard:(NSString *)cardNumber{
    if(cardNumber.length==0){
        return NO;
    }
    NSString *digitsOnly = @"";
    char c;
    for (int i = 0; i < cardNumber.length; i++){
        c = [cardNumber characterAtIndex:i];
        if (isdigit(c)){
            digitsOnly =[digitsOnly stringByAppendingFormat:@"%c",c];
        }
    }
    int sum = 0;
    int digit = 0;
    int addend = 0;
    BOOL timesTwo = false;
    for (NSInteger i = digitsOnly.length - 1; i >= 0; i--){
        digit = [digitsOnly characterAtIndex:i] - '0';
        if (timesTwo){
            addend = digit * 2;
            if (addend > 9) {
                addend -= 9;
            }
        }
        else {
            addend = digit;
        }
        sum += addend;
        timesTwo = !timesTwo;
    }
    int modulus = sum % 10;
    return modulus == 0;
}

//中文输入
+(BOOL)hf_validChinese:(NSString *)chinese{
    NSString *regex = @"[\u4e00-\u9fa5]+";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if (![pred evaluateWithObject:chinese]) {
        return NO;
    }
    return YES;
}

//数字输入
+ (BOOL)hf_validateNumber:(NSString*)number {
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}


#pragma mark - calculate distance  根据2个经纬度计算距离
#define PI 3.1415926
+(double)calculatedDistanceWithStartLng:(double)startLng startLat:(double)startLat endLng:(double)endLng endLat:(double)endLat{
    double er = 6378137; // 6378700.0f;
    //ave. radius = 6371.315 (someone said more accurate is 6366.707)
    //equatorial radius = 6378.388
    //nautical mile = 1.15078
    double startRadLat = PI*startLat/180.0f;
    double endRadLat = PI*endLat/180.0f;
    //now long.
    double startRadLng = PI*startLng/180.0f;
    double endRadLng = PI*endLng/180.0f;
    if( startRadLat < 0 ) startRadLat = PI/2 + fabs(startRadLat);// south
    if( startRadLat > 0 ) startRadLat = PI/2 - fabs(startRadLat);// north
    if( startRadLng < 0 ) startRadLng = PI*2 - fabs(startRadLng);//west
    if( endRadLat < 0 ) endRadLat = PI/2 + fabs(endRadLat);// south
    if( endRadLat > 0 ) endRadLat = PI/2 - fabs(endRadLat);// north
    if( endRadLng < 0 ) endRadLng = PI*2 - fabs(endRadLng);// west
    //spherical coordinates x=r*cos(ag)sin(at), y=r*sin(ag)*sin(at), z=r*cos(at)
    //zero ag is up so reverse lat
    double x1 = er * cos(startRadLng) * sin(startRadLat);
    double y1 = er * sin(startRadLng) * sin(startRadLat);
    double z1 = er * cos(startRadLat);
    double x2 = er * cos(endRadLng) * sin(endRadLat);
    double y2 = er * sin(endRadLng) * sin(endRadLat);
    double z2 = er * cos(endRadLat);
    double d = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
    //side, side, side, law of cosines and arccos
    double theta = acos((er*er+er*er-d*d)/(2*er*er));
    double dist  = theta*er;
    return dist;
}


@end


typedef NS_ENUM(NSInteger,NSDateFormatter_Type) {
    
    //    "YYYY-MM-dd HH:mm:ss"
    //有时分秒
    NSDateFormatter_TYPE_Y_M_d_H_m_s = 1,
    
    //没有时分秒
    NSDateFormatter_TYPE_Y_M_d,
    
    //只有时分
    NSDateFormatter_TYPE_Y_M_d_H_m
    
};


@implementation NSString(xlExtention)

-(NSString *)xl_ChangeTelNum{
    
    return [self xl_ChangeTelNumWithTailNumberLength:2];
}
-(NSString *)xl_ChangeTelNumWithTailNumberLength:(NSUInteger)length{
    if (!self.length || self.length != 11 || length > 6) {
        return self;
    }
    NSString *temp = nil;
    NSRange headerRange = NSMakeRange(0, 3);
    NSString *headerStr = [self substringWithRange:headerRange];
    NSRange tailRange = NSMakeRange(11-length, length);
    NSString *tailStr = [self substringWithRange:tailRange];
    NSMutableString * star = [NSMutableString string];
    for (NSUInteger i = 0; i < 11-length - 3; i++) {
        [star appendString:@"*"];
    }
    temp = [NSString stringWithFormat:@"%@%@%@",headerStr,star,tailStr];
    return temp;
}
+(NSAttributedString*)attrStrWithStr:(NSString*)str indent:(CGFloat)indent{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:str];
    //格式调整
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [attStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [str length])];
    style.firstLineHeadIndent = indent;
    style.headIndent = indent;
    style.tailIndent = -indent;
    return attStr;
}
-(NSAttributedString *)xl_changePrice{
    
        return [self xl_changePriceWithHightFontsize:16.f lowFontsize:14.f];
}
/**   价格富文本 默认红色 */
-(NSAttributedString *)xl_changePriceWithHightFontsize:(CGFloat)hightFont
                                           lowFontsize:(CGFloat)lowFont{
       return [self xl_changePriceWithHightFontsize:hightFont lowFontsize:lowFont color:[UIColor redColor]];
}
/**   价格富文本  */
-(NSAttributedString *)xl_changePriceWithHightFontsize:(CGFloat)hightFont
                                           lowFontsize:(CGFloat)lowFont
                                                 color:(UIColor *)color{
    NSString * str = [NSString stringWithFormat:@"￥%@",self];
    NSDictionary * lowAttr = @{NSFontAttributeName:[UIFont systemFontOfSize:lowFont],NSForegroundColorAttributeName:color};
    NSMutableAttributedString * attr = [[NSMutableAttributedString alloc] initWithString:str attributes:lowAttr];
    NSRange range = [str rangeOfString:@"."];
    range = NSMakeRange(1, range.location);
    [attr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:hightFont] range:range];
    return attr;
}
/**时间戳转换成时间 年月日 + 时分秒 */
-(NSString *)xl_DateFormatterYYYY_MM_dd_HHmmss{
    return [self xl_DateFormatterWithChangeType:NSDateFormatter_TYPE_Y_M_d_H_m_s];
}

/**时间戳转换成时间 年月日  */
-(NSString *)xl_DateFormatterYYYY_MM_dd{
    
     return [self xl_DateFormatterWithChangeType:NSDateFormatter_TYPE_Y_M_d];
}

/**时间戳转换成时间 年月日 + 时分 */
-(NSString *)xl_DateFormatterYYYY_MM_dd_HHmm{
   return [self xl_DateFormatterWithChangeType:NSDateFormatter_TYPE_Y_M_d_H_m];
}
/*
    内部实现
 */
-(NSString *)xl_DateFormatterWithChangeType:(NSDateFormatter_Type)timeType{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    switch (timeType) {
        case NSDateFormatter_TYPE_Y_M_d_H_m_s:
        {
            [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
        }
            break;
            
        case NSDateFormatter_TYPE_Y_M_d:
        {
            [formatter setDateFormat:@"YYYY-MM-dd"];
            
        }
            break;
            
        case NSDateFormatter_TYPE_Y_M_d_H_m:
        {
            [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
        }
            break;
            
        default:
            break;
    }
    NSDate *confromTimesp = nil;
    if (self.length > 10) {
        confromTimesp  = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]/1000];
    }else{
        confromTimesp = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    }
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    return confromTimespStr;
}
/** 屏幕宽 maxfloat做限制 */
-(CGFloat)xl_FontWidthWithFont:(UIFont *)font;
{
    return [self xl_FontWidthWithFont:font limitSize:CGSizeMake(kScreenW, MAXFLOAT)];
}

-(CGFloat)xl_FontWidthWithFont:(UIFont *)font limitSize:(CGSize)limitSize{
  return  [self boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.width;
}
-(void)IvarLog{
    
// unsigned int outCount = 0;
//   Ivar * ivars = class_copyIvarList(NSClassFromString(self),&outCount);
//    for (int i = 0; i < outCount; i++) {
////        指针后移遍历数组
//        NSLog(@"ivarName: %s ivarType: %s\n",ivar_getName(*(ivars+i)),ivar_getTypeEncoding(*(ivars+i)));
//    }
    
}
-(NSString *)xl_distance
{
    CGFloat dis = self.floatValue;
    if (dis > 1000) {
        return [NSString stringWithFormat:@"%.1f公里",dis/1000];
    }else
    {
        return [NSString stringWithFormat:@"%.f米",dis];
    }
}
/** 文字间距 */
-(NSAttributedString *)xl_changeStringLineSpacingWithSpace:(CGFloat)space{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:space];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self length])];
    
    return attributedString;
}
/** 不同类型之间乘法可能会出现精度缺失 */
+(NSString *)xl_DecimalNumberMutiplyWithStringValue:(NSString *)multiplierValue Value1:(NSString *)multiplicandValue{
    if (!multiplierValue.length || !multiplicandValue.length) {
        return @"0.00";
    }
    NSDecimalNumber *multiplierNumber = [NSDecimalNumber decimalNumberWithString:multiplierValue];
    NSDecimalNumber *multiplicandNumber = [NSDecimalNumber decimalNumberWithString:multiplicandValue];
    NSDecimalNumber *product = [multiplicandNumber decimalNumberByMultiplyingBy:multiplierNumber];
    return [product stringValue];
}

+(NSString *)MD5ForUpper32Bate:(NSString *)str{
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    return digest;
}

+ (NSString *)getNowTimeTimestamp{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString*timeString = [NSString stringWithFormat:@"%0.f", a * 1000];//转为字符型
    return timeString;
}
@end
