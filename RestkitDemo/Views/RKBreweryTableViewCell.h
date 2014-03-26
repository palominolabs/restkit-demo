/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>

@class RKBrewery;

static NSString *const kBreweryTableViewCellIdentifier = @"RKBreweryTableViewCell";

@interface RKBreweryTableViewCell : UITableViewCell
- (void)setBrewery:(RKBrewery *)brewery;
@end