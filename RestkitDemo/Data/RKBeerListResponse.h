/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>


@interface RKBeerListResponse : NSObject

@property (nonatomic, readonly) NSArray *beers;
@property (nonatomic, readonly) NSDictionary *metadata;

@end