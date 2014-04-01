/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerClient.h"
#import "RKBeerClientDelegate.h"
#import "RKBeerForm.h"
#import "RKAddBeerRequest.h"


@implementation RKBeerClient {
    NSObject<RKBeerClientDelegate> *_delegate;
}

- (instancetype)initWithDelegate:(NSObject <RKBeerClientDelegate> *)delegate {
    self = [super init];
    if (self) {
        _delegate = delegate;
    }

    return self;
}

-(void) getBeers {
    NSString *path = @"/beers.json";
    [[RKObjectManager sharedManager]
            getObjectsAtPath:path
                  parameters:nil
                     success:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
                         [_delegate getBeersSuccess:operation mappingResult:result];
                     }
                     failure:^(RKObjectRequestOperation *operation, NSError *error) {
                         [_delegate getBeersError:operation error:error];
                     }];
}

-(void) createBeer {
    RKBeerForm *beerForm = [RKBeerForm new];
    beerForm.name = @"A Beer From Restkit";
    beerForm.inventory = [NSNumber numberWithInt:45];
    beerForm.breweryId = [NSNumber numberWithInt:1];

    RKAddBeerRequest *addBeerRequest = [RKAddBeerRequest new];
    addBeerRequest.beerForm = beerForm;

    NSString *path = @"beers.json";
    [[RKObjectManager sharedManager]
            postObject:addBeerRequest
                  path:path
            parameters:nil
               success:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
                   [_delegate createBeerSuccess:operation mappingResult:result];
               }
               failure:^(RKObjectRequestOperation *operation, NSError *error) {
                   [_delegate createBeerError:operation error:error];
               }];
}

@end