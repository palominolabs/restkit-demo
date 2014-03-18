/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeer.h"


@implementation RKBeer {

}

@synthesize beerId;
@synthesize name;
@synthesize createdOn;
@synthesize updatedOn;
@synthesize breweryId;
@synthesize inventory;

- (instancetype)initWithId:(NSNumber *)anId name:(NSString *)aName createdOn:(NSDate *)aCreatedOn updatedOn:(NSDate *)anUpdatedOn breweryId:(NSNumber *)aBreweryId inventory:(NSNumber *)anInventory {
    self = [super init];
    if (self) {
        beerId = anId;
        name = aName;
        createdOn = aCreatedOn;
        updatedOn = anUpdatedOn;
        breweryId = aBreweryId;
        inventory = anInventory;
    }

    return self;
}

@end