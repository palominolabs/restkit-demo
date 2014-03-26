/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBreweryTableViewController.h"
#import "RKBrewery.h"
#import "RKBreweryTableViewCell.h"
#import "RKBreweryDetailViewController.h"


@implementation RKBreweryTableViewController {
    NSArray *_breweries;
}


- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Beers";

        UIImageView *bgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];

        self.tableView.backgroundView = bgImgView;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = [UIColor blackColor];
        self.tableView.tableFooterView = [UIView new];
        self.tableView.allowsSelection = YES;

        RKBrewery *brewery1 = [[RKBrewery alloc] initWithBreweryId:[NSNumber numberWithInt:1] name:@"The Bruery"];
        RKBrewery *brewery2 = [[RKBrewery alloc] initWithBreweryId:[NSNumber numberWithInt:2] name:@"Cismontane"];
        RKBrewery *brewery3 = [[RKBrewery alloc] initWithBreweryId:[NSNumber numberWithInt:3] name:@"Devil's Canyon"];

        _breweries = @[brewery1, brewery2, brewery3];
    }

    return self;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_breweries count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        RKBreweryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kBreweryTableViewCellIdentifier];

        if (cell == nil) {
            cell = [RKBreweryTableViewCell new];
        }

        RKBrewery *brewery = _breweries[(NSUInteger) indexPath.row];
        [cell setBrewery:brewery];
        return cell;
    }

    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RKBrewery *selectedBrewery = [_breweries objectAtIndex:indexPath.row];

    RKBreweryDetailViewController *detailViewController = [[RKBreweryDetailViewController alloc] initWithBrewery:selectedBrewery];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end