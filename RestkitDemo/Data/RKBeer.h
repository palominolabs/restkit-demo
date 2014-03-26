/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>


@interface RKBeer : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSNumber *beerId;
@property (nonatomic, readonly) NSNumber *inventory;
@property (nonatomic, readonly) NSNumber *averageRating;
@property (nonatomic, readonly) NSNumber *reviewsCount;
@property (nonatomic, readonly) NSDictionary *brewery;

@end