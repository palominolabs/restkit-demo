/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBreweryDetailViewController.h"
#import "RKBrewery.h"


@implementation RKBreweryDetailViewController {
    RKBrewery *_brewery;
}

- (instancetype)initWithBrewery:(RKBrewery *)brewery {
    self = [super init];
    if (self) {
        _brewery = brewery;
    }

    return self;
}


@end