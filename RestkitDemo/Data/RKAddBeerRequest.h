/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>

@class RKBeerForm;


@interface RKAddBeerRequest : NSObject

@property (nonatomic, readwrite) RKBeerForm *beer_form;

@end