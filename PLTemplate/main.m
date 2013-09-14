//
//  Created by Ry Ausanka-Crues on 2013-04-06.
//  Copyright (c) 2013 Palomino Labs, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PLAppDelegate.h"
#import "GTMStackTrace.h"

void topLevelExceptionHandler(NSException *exception) {
    NSLog(@"%@", GTMStackTraceFromException(exception));
}
void signalHandler(int code) {
    NSLog(@"Signal caught: %i", code);
}

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSSetUncaughtExceptionHandler(&topLevelExceptionHandler);
        signal(SIGABRT, signalHandler);
        signal(SIGILL, signalHandler);
        signal(SIGSEGV, signalHandler);
        signal(SIGFPE, signalHandler);
        signal(SIGBUS, signalHandler);
        signal(SIGPIPE, signalHandler);
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PLAppDelegate class]));
    }

}