//
//  Created by Ry Ausanka-Crues on 2013-04-06.
//  Copyright (c) 2013 Palomino Labs, Inc. All rights reserved.
//

// These stupid macros are needed so that we can include string constants specified in xcconfig preprocessor defines
#define nsstr(a) @"" str(a)
#define str(a) #a

#define DLOG(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

@interface PLStartup : NSObject

+ (PLStartup*)shared;

@property (readonly,nonatomic) id<GAITracker> GAITracker;

@end
