/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerTableViewController.h"
#import "RKBeer.h"
#import "RKBeerTableViewCell.h"
#import "RKBeerDetailViewController.h"
#import "RKBeerListResponse.h"
#import "RKBeerClient.h"


@implementation RKBeerTableViewController {
    RKBeerClient *_beerClient;
    NSArray *_beers;
}

- (id)init {
    self = [super init];
    if (self) {
        _beerClient = [[RKBeerClient alloc] initWithDelegate:self];

        self.title = @"Beers";

        UIImageView *bgImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];

        self.tableView.backgroundView = bgImgView;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.tableView.separatorColor = [UIColor blackColor];
        self.tableView.tableFooterView = [UIView new];
        self.tableView.allowsSelection = YES;

        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add Beer" style:UIBarButtonItemStyleBordered target:self action:@selector(addBeer)];

        [self getBeers];
    }

    return self;
}

- (void)addBeer {
    [_beerClient createBeer];
}

-(void) getBeers {
    [_beerClient getBeers];
}

#pragma mark RKBeerClientDelegate
- (void)getBeersSuccess:(RKObjectRequestOperation *)operation mappingResult:(RKMappingResult *)result {
    RKBeerListResponse *listResponse = result.firstObject;
    _beers = listResponse.beers;
    [self.tableView reloadData];
}

- (void)getBeersError:(RKObjectRequestOperation *)operation error:(NSError *)error {
    NSLog(@"Error retrieving beers");
}

- (void)createBeerSuccess:(RKObjectRequestOperation *)operation mappingResult:(RKMappingResult *)result {
    NSLog(@"Created new beer");
}

- (void)createBeerError:(RKObjectRequestOperation *)operation error:(NSError *)error {
    NSLog(@"Error creating beer");
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

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RKBeer *selectedBeer = [_beers objectAtIndex:indexPath.row];

    RKBeerDetailViewController *detailViewController = [[RKBeerDetailViewController alloc] initWithBeer:selectedBeer];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end