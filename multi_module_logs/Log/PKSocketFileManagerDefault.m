//
//  PKSocketFileManagerDefault.m
//  multi_module_logs
//
//  Created by Duke on 2023/1/4.
//

#import "PKSocketFileManagerDefault.h"

@interface PKSocketFileManagerDefault ()

@property (nonatomic, copy) NSString *fileName;

@end

@implementation PKSocketFileManagerDefault

- (instancetype)initWithLogsDirectory:(NSString *)logsDirectory
                             fileName:(NSString *)name
{
    self = [super initWithLogsDirectory:logsDirectory];
    if (self) {
        self.fileName = name;
    }
    return self;
}

#pragma mark - Override methods

- (NSString *)newLogFileName
{
    NSDateFormatter *dateFormatter = [self logFileDateFormatter];
    NSString *formattedDate = [dateFormatter stringFromDate:[NSDate date]];
    return [NSString stringWithFormat:@"%@-%@.log", self.fileName, formattedDate];
}

- (BOOL)isLogFile:(NSString *)fileName
{
    return [fileName isEqualToString:self.fileName];
}

- (NSDateFormatter *)logFileDateFormatter {

    //获取当前线程的字典
    NSMutableDictionary *dictionary = [[NSThread currentThread]
                                       threadDictionary];
    //设置日期格式
    NSString *dateFormat = @"yyyy'-'MM'-'dd'";
    NSString *key = [NSString stringWithFormat:@"logFileDateFormatter.%@", dateFormat];
    NSDateFormatter *dateFormatter = dictionary[key];

    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_CN"]];
        [dateFormatter setDateFormat:dateFormat];
        [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        dictionary[key] = dateFormatter;
    }

    return dateFormatter;
}

@end
