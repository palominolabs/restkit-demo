//
//  Created by Ry Ausanka-Crues on 2013-04-06.
//  Copyright (c) 2013 Palomino Labs, Inc. All rights reserved.
//

#import "PLStartup.h"
#import <sys/utsname.h>
#include "OpenUDID.h"

NSString*
plMachineName()
{
    struct utsname systemInfo;
    uname(&systemInfo);
    
    return [NSString stringWithCString:systemInfo.machine
                              encoding:NSUTF8StringEncoding];
}
static PLStartup* sharedPL = nil;

@implementation PLStartup {
    
}
@synthesize GAITracker;

+ (PLStartup*)shared {
    @synchronized(self)
    {
        if (sharedPL == nil) {
            sharedPL = [PLStartup new];
        }
        
    }
    return sharedPL;
}

- (id)init {
    if (self = [super init]) {
#if PL_KISSMETRICS_ENABLED
        [self initKISSmetrics];
#endif
    
#if PL_CRASHLYTICS_ENABLED
        [self initCrashlytics];
#endif
    
#if PL_GOOGLEANALYTICS_ENABLED
        [self initGoogleAnalytics];
#endif
    }
    return self;
}

- (void)initKISSmetrics {
    [KISSMetricsAPI sharedAPIWithKey:nsstr(PL_KISSMETRICS_API_KEY)];
    NSString* identifier;
    // iOS 6 : use identifierForVendor
    if ([[UIDevice currentDevice] respondsToSelector:@selector(identifierForVendor)]) {
        identifier = [NSString stringWithFormat:@"%@ - %@", [UIDevice currentDevice].name, [[[UIDevice currentDevice]identifierForVendor] UUIDString], nil];
    // iOS 5 : use OpenUDID
    } else {
        identifier = [NSString stringWithFormat:@"%@ - %@", [UIDevice currentDevice].name, [OpenUDID value], nil];
    }
    [[KISSMetricsAPI sharedAPI] identify:identifier];
    [[KISSMetricsAPI sharedAPI] setProperties:@{@"iOS Device": [UIDevice currentDevice].model,
                                          @"iOS Device Model": plMachineName(),
                                               @"iOS Version": [UIDevice currentDevice].systemVersion,
                                               @"App Version": [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]}];
}

- (void)initCrashlytics {
    [Crashlytics startWithAPIKey:nsstr(PL_CRASHLYTICS_API_KEY)];
}

- (void)initGoogleAnalytics {
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    // Optional: set debug to YES for extra debugging information.
    [GAI sharedInstance].debug = (bool)PL_GOOGLEANALYTICS_DEBUG;
    // Create tracker instance.
    GAITracker = [[GAI sharedInstance] trackerWithTrackingId:nsstr(PL_GOOGLEANALYTICS_API_KEY)];
}
@end
