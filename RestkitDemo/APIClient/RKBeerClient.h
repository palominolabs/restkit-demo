/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>

@protocol RKBeerClientDelegate;


@interface RKBeerClient : NSObject
- (instancetype)initWithDelegate:(NSObject <RKBeerClientDelegate> *)delegate;

- (void)getBeers;

- (void)createBeer;
@end