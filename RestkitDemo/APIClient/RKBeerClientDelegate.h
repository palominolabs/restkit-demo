/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import <Foundation/Foundation.h>

@protocol RKBeerClientDelegate <NSObject>

-(void) getBeersSuccess: (RKObjectRequestOperation *)operation mappingResult:(RKMappingResult *)result;

-(void) getBeersError: (RKObjectRequestOperation *)operation error:(NSError *)error;

-(void) createBeerSuccess: (RKObjectRequestOperation *)operation mappingResult:(RKMappingResult *)result;

-(void) createBeerError: (RKObjectRequestOperation *)operation error:(NSError *)error;

@end