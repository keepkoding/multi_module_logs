//
//  PKMacro.h
//  multi_module_logs
//
//  Created by Duke on 2023/1/4.
//

#ifndef PKMacro_h
#define PKMacro_h

static const DDLogLevel ddLogLevel = DDLogLevelAll;

#define PK_LOG_SOCKET_FLAG ( 1 << 10)
#define PK_LOG_BIZ_FLAG (1 << 11)

#define PK_LOG_SOCKET_LEVEL (PK_LOG_SOCKET_FLAG)
#define PK_LOG_BIZ_LEVEL (PK_LOG_BIZ_FLAG)

#define PK_SOCKET_LOGDEBUG(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagDebug, PK_LOG_SOCKET_LEVEL, nil, __PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)
#define PK_SOCKET_LOGINFO(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagInfo, PK_LOG_SOCKET_LEVEL, nil, __PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)
#define PK_SOCKET_LOGWARN(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagWarning, PK_LOG_SOCKET_LEVEL, nil, __PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)
#define PK_SOCKET_LOGERROR(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagError, PK_LOG_SOCKET_LEVEL, nil, __PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)

#define PK_BIZ_LOGDEBUG(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagDebug, PK_LOG_BIZ_LEVEL, nil, __PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)
#define PK_BIZ_LOGINFO(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagInfo, PK_LOG_BIZ_LEVEL, nil, __PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)
#define PK_BIZ_LOGWARN(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagWarning, PK_LOG_BIZ_LEVEL, nil, __PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)
#define PK_BIZ_LOGERROR(frmt, ...) LOG_MAYBE(LOG_ASYNC_ENABLED, LOG_LEVEL_DEF, DDLogFlagError, PK_LOG_BIZ_LEVEL, nil, __PRETTY_FUNCTION__, frmt, ## __VA_ARGS__)

#endif /* PKMacro_h */
