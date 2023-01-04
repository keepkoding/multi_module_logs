//
//  PKLogManager.h
//  multi_module_logs
//
//  Created by Duke on 2023/1/4.
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

NS_ASSUME_NONNULL_BEGIN

@interface PKLogManager : NSObject

+(id<DDLogger>)createModuleFileManager:(NSInteger) logLevel forFileName:(NSString *) fileName;

@end

NS_ASSUME_NONNULL_END
