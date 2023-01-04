//
//  PKLogManager.m
//  multi_module_logs
//
//  Created by Duke on 2023/1/4.
//

#import "PKLogManager.h"
#import "PKSocketFileManagerDefault.h"
#import "PKContextWhitelistFilterLogFormatter.h"
#import "PKMacro.h"

@implementation PKLogManager

+(id<DDLogger>)createModuleFileManager:(NSInteger) logLevel forFileName:(NSString *) fileName{
    NSString *logsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Logs"];
    DDLogInfo(@"Log Path: %@", logsDirectory);
    PKSocketFileManagerDefault *bizFileManager = [[PKSocketFileManagerDefault alloc] initWithLogsDirectory:logsDirectory fileName:fileName];
    DDFileLogger *bizLogger = [[DDFileLogger alloc] initWithLogFileManager:bizFileManager];
    bizLogger.maximumFileSize = 1024 * 1024 * 10; //单文件最大10M
    bizLogger.rollingFrequency = 7 * 60 * 60 * 24; //保存7天
    bizLogger.logFileManager.maximumNumberOfLogFiles = 7;
    
    PKContextWhitelistFilterLogFormatter *bizFormatter = [[PKContextWhitelistFilterLogFormatter alloc] init];
    [bizFormatter addToWhitelist:logLevel];
    [bizLogger setLogFormatter:bizFormatter];
    [DDLog addLogger:bizLogger withLevel:DDLogLevelAll];
    return  bizLogger;
}

@end
