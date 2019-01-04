//
//  NSDate+extension.m
//  520SHQ
//
//  Created by Macx on 2017/9/25.
//  Copyright © 2017年 520shq.com. All rights reserved.
//

#import "NSDate+extension.h"

@implementation NSDate (extension)
- (NSDateComponents *)deltaFrom:(NSDate *)from
{
    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 比较时间
    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    return [calendar components:unit fromDate:from toDate:self options:0];
}

- (BOOL)isThisYear
{
    // 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    
    return nowYear == selfYear;
}

//- (BOOL)isToday
//{
//    // 日历
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//
//    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
//
//    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
//    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
//
//    return nowCmps.year == selfCmps.year
//    && nowCmps.month == selfCmps.month
//    && nowCmps.day == selfCmps.day;
//}

- (BOOL)isToday
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSString *selfString = [fmt stringFromDate:self];
    
    return [nowString isEqualToString:selfString];
}

- (BOOL)isYesterday
{
    // 2014-12-31 23:59:59 -> 2014-12-31
    // 2015-01-01 00:00:01 -> 2015-01-01
    
    // 日期格式化类
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSDate *nowDate = [fmt dateFromString:[fmt stringFromDate:[NSDate date]]];
    NSDate *selfDate = [fmt dateFromString:[fmt stringFromDate:self]];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}


+(NSInteger)getYear{
    NSDateComponents *d = [self getDateComponents];
    return d.year;
}

+(NSInteger)getMonth{
    NSDateComponents *d = [self getDateComponents];
    return d.month;
}

+(NSInteger)getDay{
    NSDateComponents *d = [self getDateComponents];
    return d.day;
}

+(NSInteger)getHour{
    NSDateComponents *d = [self getDateComponents];
    return d.hour;
}

+(NSInteger)getMin{
    NSDateComponents *d = [self getDateComponents];
    return d.minute;
}

+(NSInteger)getSec{
    NSDateComponents *d = [self getDateComponents];
    return d.second;
}

+(NSInteger)getNowTotalSec{
    //获取当前时间时分秒
    NSInteger nowHour = [self getHour];
    NSInteger nowMin = [self getMin];
    NSInteger nowSec = [self getSec];
    return nowHour *3600 + nowMin *60 + nowSec;
}


//获取当前日期的毫秒数
+ (long long)getCurrentTimeInterval{
    return [[NSDate date] timeIntervalSince1970];
}

//获取字符串日期的毫秒数
+ (long long)getTimeIntervalWithString:(NSString*)time{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1=[dateFormatter dateFromString:time];
    return [date1 timeIntervalSince1970];
}

//将时间戳转换为字符串NSDate类型(yyyy-MM-dd HH:mm)的时间字符串
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

//将UTCString转为时间戳
+ (NSTimeInterval)timeStamapFromUTCString:(NSString *)UTCString{

     //先将UTC字符串转为UTCDate;
    if (UTCString.length > 18){
        
        UTCString = [UTCString substringToIndex:19];
    }
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     NSTimeZone *tz = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
     [dateFormatter setTimeZone:tz];
     [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
     NSDate *UTCDate = [dateFormatter dateFromString:UTCString];
    
     NSTimeInterval timeInterval = [UTCDate timeIntervalSince1970];
     return timeInterval;
 }

//将当前时间（UTCDate）转为时间戳
+ (NSString *)timeStampFromUTCDate:(NSDate *)UTCDate{
    
    NSTimeInterval timeInterval = [UTCDate timeIntervalSince1970];
    // *1000,是精确到毫秒；这里是精确到秒;
    NSString *result = [NSString stringWithFormat:@"%.0f",timeInterval];
    return result;
}

//时间是否在现在时间之后
+(BOOL)isMorethanCurrentTime:(NSString *)needCompareTime{
    NSTimeInterval needCompare = [self timeStamapFromUTCString:needCompareTime];
    NSTimeInterval current = [[NSDate date] timeIntervalSince1970];
    if (needCompare > current){
        
        return YES;
    }
    return NO;
}

+(NSDateComponents *)getDateComponents{
    NSDate *date = [NSDate date];//这个是NSDate类型的日期，所要获取的年月日都放在这里；
    NSCalendar *cal = [NSCalendar currentCalendar];
    unsigned int unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|
    NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;//这句是说你要获取日期的元素有哪些。获取年就要写NSYearCalendarUnit，获取小时就要写NSHourCalendarUnit，中间用|隔开；
    NSDateComponents *d = [cal components:unitFlags fromDate:date];//把要从date中获取的unitFlags标示
    return d;
}

@end
