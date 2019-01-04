//
//  NSString+extension.h
//  520SHQ
//
//  Created by Macx on 2017/8/17.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString (extension)
/** 去除字符串前后空格.
去除字符串前后空格的字符串
*/
-(NSString*)hf_trim;
/** 除前后空格.
 @return 除前后空格
 */
-(NSString*)hf_trimWhites;
//缓存路径
- (NSString *)cacheWithPath;

/*计算文字高度*/
- (CGFloat)heightWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGFloat)widthWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (CGFloat)widthForString:(CGSize)size font:(CGFloat)font;

//高度
-(CGFloat)hf_widthWithHeight:(CGFloat)height font:(UIFont*)font;
//宽度
-(CGFloat)hf_heightWithWidth:(CGFloat)width font:(UIFont*)font;
/*计算文字 宽高 size*/
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

//固话或者移动电话
+ (BOOL)isPhoneNo:(NSString *)phone;
//手机号码
+ (BOOL)hf_validateMobile:(NSString *)mobile;
/*固话号码*/
+(BOOL)hf_fixedMobile:(NSString *)mobile;
/*邮编号码*/
+(BOOL)hf_postcodeValidateWithStr:(NSString *)str;
//邮箱
+ (BOOL)hf_validateEmail:(NSString *)email;
//密码
+ (BOOL)hf_validatePassword:(NSString *)passWord;
//身份证
+ (BOOL)hf_validateIdentityCard:(NSString *)identityCard;
//昵称
+ (BOOL)hf_validateNickname:(NSString *)nickname;
//街道楼号
+(BOOL)hf_validateAvenue:(NSString*)avenue;
//只能输入中文
+(BOOL)hf_validChinese:(NSString *)chinese;
//银行卡号
+(BOOL)hf_validBankCard:(NSString *)cardNumber;
//数字输入
+ (BOOL)hf_validateNumber:(NSString*)number;
//web接口拦截处理
+ (NSDictionary *)webUrlHandleWithUrlStr:(NSString *)urlStr;

#pragma mark - calculate distance  根据2个经纬度计算距离
+(double)calculatedDistanceWithStartLng:(double)startLng startLat:(double)startLat endLng:(double)endLng endLat:(double)endLat;

@end

@interface NSString (xlExtention)
-(void)IvarLog;
/** 文字间距 */
-(NSAttributedString *)xl_changeStringLineSpacingWithSpace:(CGFloat)space;
/** 处理距离文字 */
-(NSString *)xl_distance;
/** 输出string对应类名的成员变量 */
//-(void)IvarLog;
/** 手机号码加星星 （默认头三尾二）*/
-(NSString *)xl_ChangeTelNum;

/** 好像有的地方尾号要求留4位 */
-(NSString *)xl_ChangeTelNumWithTailNumberLength:(NSUInteger)length;
+(NSAttributedString*)attrStrWithStr:(NSString*)str indent:(CGFloat)indent;
/** 小数点前面的数字大写   font is 16/14*/
-(NSAttributedString *)xl_changePrice;

/**   价格富文本 默认红色 */
-(NSAttributedString *)xl_changePriceWithHightFontsize:(CGFloat)hightFont
                                           lowFontsize:(CGFloat)lowFont;
/**   价格富文本  */
-(NSAttributedString *)xl_changePriceWithHightFontsize:(CGFloat)hightFont
                                           lowFontsize:(CGFloat)lowFont
                                                 color:(UIColor *)color;
/** 屏幕宽 maxfloat做限制 */
-(CGFloat)xl_FontWidthWithFont:(UIFont *)font;

-(CGFloat)xl_FontWidthWithFont:(UIFont *)font limitSize:(CGSize)limitSize;

/** 时间戳转换成时间 年月日 + 时分秒 */
-(NSString*)xl_DateFormatterYYYY_MM_dd_HHmmss;

/** 时间戳转换成时间 年月日 */
-(NSString *)xl_DateFormatterYYYY_MM_dd;

/** 时间戳转换成时间 年月日 + 时分 */
-(NSString *)xl_DateFormatterYYYY_MM_dd_HHmm;

+(NSString *)xl_DecimalNumberMutiplyWithStringValue:(NSString *)multiplierValue Value1:(NSString *)multiplicandValue;

+(NSString *)MD5ForUpper32Bate:(NSString *)str;

+ (NSString *)getNowTimeTimestamp;
@end
