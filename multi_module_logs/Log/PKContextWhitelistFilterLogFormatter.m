//
//  PKContextWhitelistFilterLogFormatter.m
//  multi_module_logs
//
//  Created by Duke on 2023/1/4.
//

#import "PKContextWhitelistFilterLogFormatter.h"

@implementation PKContextWhitelistFilterLogFormatter

- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
{
    if ([self isOnWhitelist:logMessage->_context]) { // 通过此判断来完成日志的分模块操作
        NSString *logLevel;
        switch (logMessage->_flag) {
            case DDLogFlagError    : logLevel = @"ERROR"; break;
            case DDLogFlagWarning  : logLevel = @"WARN"; break;
            case DDLogFlagInfo     : logLevel = @"INFO"; break;
            case DDLogFlagDebug    : logLevel = @"DEBUG"; break;
            default                : logLevel = @"VIEW"; break;
        }
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss SSS"];
        [formatter setLocale:[NSLocale currentLocale]];
        NSString *timestap =  [formatter stringFromDate:logMessage->_timestamp];
        
        return [NSString stringWithFormat:@"%@ | %@ | %@", timestap, logLevel, logMessage->_message];
    } else {
        return nil;
    }
    
}

@end
