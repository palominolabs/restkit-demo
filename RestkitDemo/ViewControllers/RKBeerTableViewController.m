/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerTableViewController.h"
#import "RKBeer.h"
#import "RKBeerTableViewCell.h"
#import "RKBeerDetailViewController.h"
#import "UIView+UIViewLayoutAdditions.h"


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

        [self getBeers];
    }

    return self;
}

-(void) getBeers {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[RKBeer class]];
    [mapping addAttributeMappingsFromDictionary:@{
            @"id" : @"beerId",
            @"name" : @"name"
    }];
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping pathPattern:@"/beers.json" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://restkittechtalknoauth2a83.ninefold-apps.com/beers.json"]];
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:@[responseDescriptor]];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *result) {
        _beers = result.array;
        [self.tableView reloadData];
        NSLog(@"Mapped the beers");
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"Failed with error: %@", [error localizedDescription]);
    }];
    [operation start];
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