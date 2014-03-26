/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>


@interface RKBrewery : NSObject

@property (nonatomic, readonly) NSNumber *breweryId;
@property (nonatomic, readonly) NSString *name;

- (instancetype)initWithBreweryId:(NSNumber *)breweryId name:(NSString *)name;


@end