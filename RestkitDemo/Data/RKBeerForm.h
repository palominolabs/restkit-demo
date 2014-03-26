/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>


@interface RKBeerForm : NSObject

@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSNumber *inventory;
@property (nonatomic, readwrite) NSNumber *breweryId;

@end