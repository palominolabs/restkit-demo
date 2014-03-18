/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>

@class RKBeer;

static NSString *const kBeerTableViewCellIdentifier = @"RKBeerTableViewCell";

@interface RKBeerTableViewCell : UITableViewCell
- (void)setBeer:(RKBeer *)beer;
@end