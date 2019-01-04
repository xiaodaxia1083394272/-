//
//  NSDate+extension.h
//  520SHQ
//
//  Created by Macx on 2017/9/25.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (extension)
/**
 * 比较from和self的时间差值
 */
- (NSDateComponents *)deltaFrom:(NSDate *)from;

/**
 * 是否为今年
 */
- (BOOL)isThisYear;

/**
 * 是否为今天
 */
- (BOOL)isToday;

/**
 * 是否为昨天
 */
- (BOOL)isYesterday;


+(NSInteger)getYear;
+(NSInteger)getMonth;
+(NSInteger)getDay;
+(NSInteger)getHour;
+(NSInteger)getMin;
+(NSInteger)getSec;
+(NSInteger)getNowTotalSec;//只计算 时／分／秒之间的总和

//获取当前日期的毫秒数
+ (long long)getCurrentTimeInterval;
//获取字符串日期的毫秒数
+ (long long)getTimeIntervalWithString:(NSString*)time;

//将时间戳转换为字符串NSDate类型(yyyy-MM-dd HH:mm)的时间字符串
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;


//时间是否在现在时间之后
+(BOOL)isMorethanCurrentTime:(NSString *)needCompareTime;





@end
