/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerTableViewController.h"
#import "RKBeer.h"
#import "RKBeerTableViewCell.h"
#import "RKBeerDetailViewController.h"
#import "UIView+UIViewLayoutAdditions.h"
#import "RKBeerListResponse.h"
#import "RKBeerForm.h"
#import "RKAddBeerRequest.h"


@implementation RKBeerTableViewController {
    NSArray *_beers;
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

        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Add Beer" style:UIBarButtonItemStyleBordered target:self action:@selector(addBeer)];

        [self getBeers];
    }

    return self;
}

- (void)addBeer {
    RKBeerForm *beerForm = [RKBeerForm new];
    beerForm.name = @"A Beer From Restkit";
    beerForm.inventory = [NSNumber numberWithInt:45];
    beerForm.breweryId = [NSNumber numberWithInt:1];

    RKAddBeerRequest *addBeerRequest = [RKAddBeerRequest new];
    addBeerRequest.beer_form = beerForm;

    NSString *path = @"beers.json";
    [[RKObjectManager sharedManager]
            postObject:addBeerRequest
                  path:path
            parameters:nil
               success:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
                   NSLog(@"successfully added beer");
               }
               failure:^(RKObjectRequestOperation *operation, NSError *error) {
                   NSLog(@"error adding beer");
               }];
}

-(void) getBeers {
    NSString *path = @"/beers.json";
    [[RKObjectManager sharedManager]
            getObjectsAtPath:path
                  parameters:nil
                     success:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
                         RKBeerListResponse *listResponse = result.firstObject;
                         _beers = listResponse.beers;
                         [self.tableView reloadData];
                         NSLog(@"Mapped the beers");
                     }
                     failure:^(RKObjectRequestOperation *operation, NSError *error) {
                         NSLog(@"Failed with error: %@", [error localizedDescription]);
                     }];
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