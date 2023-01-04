//
//  AppDelegate.m
//  multi_module_logs
//
//  Created by Duke on 2023/1/4.
//

#import "AppDelegate.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import "PKLogManager.h"
#import "PKMacro.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    // 1.发送到 Xcode 控制台
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    // 原有的日志
    DDLogDebug(@"This is debug level log");
    DDLogWarn(@"This is warn level log");
    DDLogInfo(@"This is info level log");
    DDLogError(@"This is error level log");
    
    // 自定义的日志
    [PKLogManager createModuleFileManager:PK_LOG_SOCKET_FLAG forFileName:@"ModuleA"];
    [PKLogManager createModuleFileManager:PK_LOG_BIZ_FLAG forFileName:@"ModuleB"];
    
    PK_SOCKET_LOGDEBUG(@"Module A Debug log");
    PK_SOCKET_LOGWARN(@"Module A Warn log");
    PK_SOCKET_LOGINFO(@"Module A Info log");
    
    PK_BIZ_LOGDEBUG(@"Module B Debug Log");
    PK_BIZ_LOGWARN(@"Module B Debug Log");
    PK_BIZ_LOGINFO(@"Module B Info log");
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
