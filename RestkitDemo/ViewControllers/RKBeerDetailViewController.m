/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerDetailViewController.h"
#import "RKBeer.h"
#import "RKBeerDetailView.h"


@implementation RKBeerDetailViewController {
    RKBeer *_beer;
}

- (instancetype)initWithBeer:(RKBeer *)beer {
    self = [super init];
    if (self) {
        _beer = beer;
    }

    return self;
}

- (void)loadView {
    RKBeerDetailView *detailView = [[RKBeerDetailView alloc] initWithBeer:_beer];
    self.view = detailView;
}


@end