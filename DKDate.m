//
//  DKDate.m
//  MyBoby
//
//  Created by 王亚振 on 2019/11/12.
//  Copyright © 2019 DEMOKING. All rights reserved.
//

#import "DKDate.h"

@implementation DKDate
+ (NSString *)formatterStringWithFormatter:(DKDateFormatter)formatter {
    switch (formatter) {
        // yyyyMMddHHmmss
        case DKDateFormatter_yyyyMMddHHmmss:
            return @"yyyyMMddHHmmss";break;
        // yyyy/MM/dd HH:mm:ss
        case DKDateFormatter_yyyy_MM_dd_HH_mm_ss:
            return @"yyyy/MM/dd HH:mm:ss";break;
        // yyyy-MM-dd HH:mm:ss
        case DKDateFormatter_yyyy__MM__dd_HH_mm_ss:
            return @"yyyy-MM-dd HH:mm:ss";break;
        // yyyyMMdd
        case DKDateFormatter_yyyyMMdd:
            return @"yyyyMMdd";break;
        // yyyy/MM/dd
        case DKDateFormatter_yyyy_MM_dd:
            return @"yyyy/MM/dd";break;
        // yyyy-MM-dd
        case DKDateFormatter_yyyy__MM__dd:
            return @"yyyy-MM-dd";break;
        // yyyyMM
        case DKDateFormatter_yyyyMM:
            return @"yyyyMM";break;
        // yyyy/MM
        case DKDateFormatter_yyyy_MM:
            return @"yyyy/MM";break;
        // yyyy-MM
        case DKDateFormatter_yyyy__MM:
            return @"yyyy-MM";break;
        // MM/dd
        case DKDateFormatter_MM_dd:
            return @"MM/dd";break;
        // MM-dd
        case DKDateFormatter_MM__dd:
            return @"MM-dd";break;
        // HHmmss
        case DKDateFormatter_HHmmss:
            return @"HHmmss";break;
        // HH:mm:ss
        case DKDateFormatter_HH_mm_ss:
            return @"HH:mm:ss";break;
        // HHmm
        case DKDateFormatter_HHmm:
            return @"HHmm";break;
        // HH:mm
        case DKDateFormatter_HH_mm:
            return @"HH:mm";break;
        // yyyy
        case DKDateFormatter_yyyy:
            return @"yyyy";break;
        // MM
        case DKDateFormatter_MM:
            return @"MM";break;
        // dd
        case DKDateFormatter_dd:
            return @"dd";break;
        // HH
        case DKDateFormatter_HH:
            return @"HH";break;
        // mm
        case DKDateFormatter_mm:
            return @"mm";break;
        // ss
        case DKDateFormatter_ss:
            return @"ss";break;
        default:
            return nil;
            break;
    }
}
+ (NSDateFormatter *)dateFormatterWithFormatter:(DKDateFormatter)formatter {
    NSString *formatterString = [DKDate formatterStringWithFormatter:formatter];
    if (formatterString == nil) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = [DKDate formatterStringWithFormatter:formatter];
    return dateFormatter;
}
/// 获取当前date
+ (NSDate *)date {
    return [NSDate date];
}

/// 时间戳转date
+ (NSDate *)dateWithTimestemp:(NSTimeInterval)timestemp {
    return [NSDate dateWithTimeIntervalSince1970:timestemp];
}

/// 时间戳
+ (NSTimeInterval)timestemp {
    return [[DKDate date] timeIntervalSince1970];
}

/// 10位长度时间戳
+ (NSInteger)timestempForTen {
    return (NSInteger)[[DKDate date] timeIntervalSince1970];
}

/// 时间戳 例如 1573520465.463748
+ (NSTimeInterval)timestempWithDate:(NSDate *)date {
    return [date timeIntervalSince1970];
}

/// 10位长度时间戳 例如 1573520465
+ (NSInteger)timestempForTenWithDate:(NSDate *)date {
    return (NSInteger)[date timeIntervalSince1970];
}

/// 获取较早的一个时间对象 返回值即为比较后的对象
+ (NSDate *)earlier:(NSDate *)date1 date2:(NSDate *)date2 {
    return [date1 earlierDate:date2];
}

/// 获取较晚的一个时间对象 返回date1 date2其中一个对象
+ (NSDate *)later:(NSDate *)date1 date2:(NSDate *)date2 {
    return [date1 laterDate:date2];
}

/// 时间是否一样
+ (BOOL)isEqualToDate:(NSDate *)date1 date2:(NSDate *)date2 {
    return [date1 isEqualToDate:date2];
}

/// 两个date之间的时间戳差值
+ (NSInteger)timestempSpaceWithDate1:(NSDate *)date1 date2:(NSDate *)date2 {
    return [DKDate timestempForTenWithDate:date1] - [DKDate timestempForTenWithDate:date2];
}

/// 字符串转date
/// @param dateString NSString
/// @param formatter DKDateFormatter
+ (NSDate *)dateWithString:(NSString *)dateString formatter:(DKDateFormatter)formatter {
    if (dateString == nil) {
        return nil;
    }
    NSDateFormatter *dateFormatter = [DKDate dateFormatterWithFormatter:formatter];
    if (dateFormatter == nil) {
        return nil;
    }
    return [dateFormatter dateFromString:dateString];
}

/// date转字符串
/// @param date NSDate
/// @param formatter DKDateFormatter
+ (NSString *)stringWithDate:(NSDate *)date formatter:(DKDateFormatter)formatter {
    NSDateFormatter *dateFormatter = [DKDate dateFormatterWithFormatter:formatter];
    if (dateFormatter == nil) {
        return nil;
    }
    return [dateFormatter stringFromDate:date];
}

/// 时间戳转字符串
/// @param timestemp NSTimeInterval
/// @param formatter DKDateFormatter
+ (NSString *)stringWithTimestemp:(NSTimeInterval)timestemp formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithTimestemp:timestemp];
    return [DKDate stringWithDate:date formatter:formatter];
}

/// 字符串转时间戳
/// @param timeString NSString
/// @param formatter DKDateFormatter
+ (NSTimeInterval)timestempWithString:(NSString *)timeString formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithString:timeString formatter:formatter];
    return [date timeIntervalSince1970];
}

/// 字符串转10位时间戳
/// @param timeString NSString
/// @param formatter DKDateFormatter
+ (NSInteger)timestempForTenWithString:(NSString *)timeString formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithString:timeString formatter:formatter];
    return (NSInteger)[date timeIntervalSince1970];
}

/// 获取年
+ (NSString *)yearWithDate:(NSDate *)date {
    return [DKDate stringWithDate:date formatter:DKDateFormatter_yyyy];
}
/// 获取月
+ (NSString *)monthWithDate:(NSDate *)date {
    return [DKDate stringWithDate:date formatter:DKDateFormatter_MM];
}
/// 获取日
+ (NSString *)dayWithDate:(NSDate *)date {
    return [DKDate stringWithDate:date formatter:DKDateFormatter_dd];
}
/// 获取时
+ (NSString *)hourWithDate:(NSDate *)date {
    return [DKDate stringWithDate:date formatter:DKDateFormatter_HH];
}
/// 获取分
+ (NSString *)minuteWithDate:(NSDate *)date {
    return [DKDate stringWithDate:date formatter:DKDateFormatter_mm];
}
/// 获取秒
+ (NSString *)secondWithDate:(NSDate *)date {
    return [DKDate stringWithDate:date formatter:DKDateFormatter_ss];
}

/// 获取年
+ (NSString *)yearWithString:(NSString *)string formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithString:string formatter:formatter];
    return [DKDate yearWithDate:date];
}
/// 获取月
+ (NSString *)monthWithString:(NSString *)string formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithString:string formatter:formatter];
    return [DKDate monthWithDate:date];
}
/// 获取日
+ (NSString *)dayWithString:(NSString *)string formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithString:string formatter:formatter];
    return [DKDate dayWithDate:date];
}
/// 获取时
+ (NSString *)hourWithString:(NSString *)string formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithString:string formatter:formatter];
    return [DKDate hourWithDate:date];
}
/// 获取分
+ (NSString *)minuteWithString:(NSString *)string formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithString:string formatter:formatter];
    return [DKDate minuteWithDate:date];
}
/// 获取秒
+ (NSString *)secondWithString:(NSString *)string formatter:(DKDateFormatter)formatter {
    NSDate *date = [DKDate dateWithString:string formatter:formatter];
    return [DKDate secondWithDate:date];
}

/// 某个时间过去了多久 单位 秒 分钟 小时 天
/// @param date NSDate
+ (NSString *)stringWithDatePass:(NSDate *)date {
    NSDate *currentDate = [DKDate date];
    NSInteger dateTimestemp = [DKDate timestempForTenWithDate:date];
    NSInteger currentDateTimestemp = [DKDate timestempForTenWithDate:currentDate];
    if (dateTimestemp >= currentDateTimestemp) {
        return @"-1";
    }
    NSInteger space = currentDateTimestemp - dateTimestemp;
    if (space < 60) {
        return [NSString stringWithFormat:@"%ld秒",space];
    }else if (space < 60 * 60) {
        return [NSString stringWithFormat:@"%ld分钟",space / 60];
    }else if (space < 60 * 60 * 24) {
        return [NSString stringWithFormat:@"%ld小时",space / (60 * 60)];
    }else {
        return [NSString stringWithFormat:@"%ld天",space / (60 * 60) / 24];
    }
}
@end
