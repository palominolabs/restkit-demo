/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>


@interface RKBeer : NSObject

@property (nonatomic, readonly) NSNumber *beerId;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSDate *createdOn;
@property (nonatomic, readonly) NSDate *updatedOn;
@property (nonatomic, readonly) NSNumber *breweryId;
@property (nonatomic, readonly) NSNumber *inventory;

- (instancetype)initWithId:(NSNumber *)anId name:(NSString *)aName createdOn:(NSDate *)aCreatedOn updatedOn:(NSDate *)anUpdatedOn breweryId:(NSNumber *)aBreweryId inventory:(NSNumber *)anInventory;


@end