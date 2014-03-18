/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerTableViewController.h"
#import "RKBeer.h"
#import "RKBeerTableViewCell.h"


@implementation RKBeerTableViewController {
    NSArray *_beers;
}

- (id)init {
    self = [super init];
    if (self) {
        RKBeer *beer1 = [[RKBeer alloc] initWithId:[NSNumber numberWithInt:1] name:@"A Beer" createdOn:[NSDate new] updatedOn:[NSDate new] breweryId:[NSNumber numberWithInt:1] inventory:[NSNumber numberWithInt:1]];
        RKBeer *beer2 = [[RKBeer alloc] initWithId:[NSNumber numberWithInt:1] name:@"Another Beer" createdOn:[NSDate new] updatedOn:[NSDate new] breweryId:[NSNumber numberWithInt:1] inventory:[NSNumber numberWithInt:1]];
        RKBeer *beer3 = [[RKBeer alloc] initWithId:[NSNumber numberWithInt:1] name:@"A Third Beer" createdOn:[NSDate new] updatedOn:[NSDate new] breweryId:[NSNumber numberWithInt:1] inventory:[NSNumber numberWithInt:1]];

        _beers = @[beer1, beer2, beer3];
    }

    return self;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_beers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        RKBeerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBeerTableViewCellIdentifier];

        if (cell == nil) {
            cell = [RKBeerTableViewCell new];
        }

        RKBeer *beer = _beers[(NSUInteger) indexPath.row];
        [cell setBeer:beer];
        return cell;
    }

    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end