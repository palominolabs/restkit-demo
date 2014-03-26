/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBrewery.h"


@implementation RKBrewery {

}
@synthesize breweryId = _breweryId;
@synthesize name = _name;

- (instancetype)initWithBreweryId:(NSNumber *)breweryId name:(NSString *)name {
    self = [super init];
    if (self) {
        _breweryId = breweryId;
        _name = name;
    }

    return self;
}


@end