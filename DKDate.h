//
//  DKDate.h
//  MyBoby
//
//  Created by 王亚振 on 2019/11/12.
//  Copyright © 2019 DEMOKING. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    // yyyyMMddHHmmss
    DKDateFormatter_yyyyMMddHHmmss,
    // yyyy/MM/dd HH:mm:ss
    DKDateFormatter_yyyy_MM_dd_HH_mm_ss,
    // yyyy-MM-dd HH:mm:ss
    DKDateFormatter_yyyy__MM__dd_HH_mm_ss,
    // yyyyMMdd
    DKDateFormatter_yyyyMMdd,
    // yyyy/MM/dd
    DKDateFormatter_yyyy_MM_dd,
    // yyyy-MM-dd
    DKDateFormatter_yyyy__MM__dd,
    // yyyyMM
    DKDateFormatter_yyyyMM,
    // yyyy/MM
    DKDateFormatter_yyyy_MM,
    // yyyy-MM
    DKDateFormatter_yyyy__MM,
    // MM/dd
    DKDateFormatter_MM_dd,
    // MM-dd
    DKDateFormatter_MM__dd,
    // HHmmss
    DKDateFormatter_HHmmss,
    // HH:mm:ss
    DKDateFormatter_HH_mm_ss,
    // HHmm
    DKDateFormatter_HHmm,
    // HH:mm
    DKDateFormatter_HH_mm,
    // yyyy
    DKDateFormatter_yyyy,
    // MM
    DKDateFormatter_MM,
    // dd
    DKDateFormatter_dd,
    // HH
    DKDateFormatter_HH,
    // mm
    DKDateFormatter_mm,
    // ss
    DKDateFormatter_ss,
} DKDateFormatter;

@interface DKDate : NSObject

#pragma mark --
#pragma mark -- date & 时间戳

/// 获取当前date
+ (NSDate *)date;

/// 时间戳转date
+ (NSDate *)dateWithTimestemp:(NSTimeInterval)timestemp;

/// 时间戳 例如 1573520465.463748
+ (NSTimeInterval)timestemp;

/// 10位长度时间戳 例如 1573520465
+ (NSInteger)timestempForTen;

/// 时间戳 例如 1573520465.463748
+ (NSTimeInterval)timestempWithDate:(NSDate *)date;

/// 10位长度时间戳 例如 1573520465
+ (NSInteger)timestempForTenWithDate:(NSDate *)date;

/// 获取较早的一个时间对象 返回date1 date2其中一个对象
+ (NSDate *)earlier:(NSDate *)date1 date2:(NSDate *)date2;

/// 获取较早的一个时间对象 返回date1 date2其中一个对象
+ (NSDate *)later:(NSDate *)date1 date2:(NSDate *)date2;

/// 时间是否一样 即：时间戳大小是否一致
+ (BOOL)isEqualToDate:(NSDate *)date1 date2:(NSDate *)date2;

/// 两个date之间的时间戳差值
+ (NSInteger)timestempSpaceWithDate1:(NSDate *)date1 date2:(NSDate *)date2;

#pragma mark --
#pragma mark -- date & string

/// 字符串转date
/// @param dateString NSString
/// @param formatter DKDateFormatter
+ (NSDate *)dateWithString:(NSString *)dateString formatter:(DKDateFormatter)formatter;

/// date转字符串
/// @param date NSDate
/// @param formatter DKDateFormatter
+ (NSString *)stringWithDate:(NSDate *)date formatter:(DKDateFormatter)formatter;

#pragma mark --
#pragma mark -- string & 时间戳

/// 时间戳转字符串
/// @param timestemp NSTimeInterval
/// @param formatter DKDateFormatter
+ (NSString *)stringWithTimestemp:(NSTimeInterval)timestemp formatter:(DKDateFormatter)formatter;

/// 字符串转时间戳
/// @param timeString NSString
/// @param formatter DKDateFormatter
+ (NSTimeInterval)timestempWithString:(NSString *)timeString formatter:(DKDateFormatter)formatter;


/// 字符串转10位时间戳
/// @param timeString NSString
/// @param formatter DKDateFormatter
+ (NSInteger)timestempForTenWithString:(NSString *)timeString formatter:(DKDateFormatter)formatter;

#pragma mark --
#pragma mark -- 获取单个时间

/// 获取年
+ (NSString *)yearWithDate:(NSDate *)date;
/// 获取月
+ (NSString *)monthWithDate:(NSDate *)date;
/// 获取日
+ (NSString *)dayWithDate:(NSDate *)date;
/// 获取时
+ (NSString *)hourWithDate:(NSDate *)date;
/// 获取分
+ (NSString *)minuteWithDate:(NSDate *)date;
/// 获取秒
+ (NSString *)secondWithDate:(NSDate *)date;

/// 获取年
+ (NSString *)yearWithString:(NSString *)string formatter:(DKDateFormatter)formatter;
/// 获取月
+ (NSString *)monthWithString:(NSString *)string formatter:(DKDateFormatter)formatter;
/// 获取日
+ (NSString *)dayWithString:(NSString *)string formatter:(DKDateFormatter)formatter;
/// 获取时
+ (NSString *)hourWithString:(NSString *)string formatter:(DKDateFormatter)formatter;
/// 获取分
+ (NSString *)minuteWithString:(NSString *)string formatter:(DKDateFormatter)formatter;
/// 获取秒
+ (NSString *)secondWithString:(NSString *)string formatter:(DKDateFormatter)formatter;

#pragma mark --
#pragma mark -- PRIVATE 某个时间(date)过去了多久

/// 某个时间过去了多久 单位 秒 分钟 小时 天
/// @param date NSDate
+ (NSString *)stringWithDatePass:(NSDate *)date;


@end
