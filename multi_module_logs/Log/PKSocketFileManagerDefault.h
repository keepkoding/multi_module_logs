//
//  PKSocketFileManagerDefault.h
//  multi_module_logs
//
//  Created by Duke on 2023/1/4.
//

#import <CocoaLumberjack/CocoaLumberjack.h>

NS_ASSUME_NONNULL_BEGIN

@interface PKSocketFileManagerDefault : DDLogFileManagerDefault

- (instancetype)initWithLogsDirectory:(NSString *)logsDirectory fileName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
