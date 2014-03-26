/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBreweryTableViewCell.h"
#import "RKBrewery.h"
#import "UIView+UIViewLayoutAdditions.h"


@implementation RKBreweryTableViewCell {
    RKBrewery *_brewery;

    UIImageView *_logoImgView;
    UILabel *_nameLabel;
}

- (id)init {
    self = [super init];
    if (self) {
        _logoImgView = [UIImageView new];

        _nameLabel = [UILabel new];

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        [self addSubview:_logoImgView];
        [self addSubview:_nameLabel];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    if (_brewery.breweryId.intValue == 1) {
        _logoImgView.image = [UIImage imageNamed:@"bruery logo"];
    } else if (_brewery.breweryId.intValue == 2) {
        _logoImgView.image = [UIImage imageNamed:@"cismontane logo"];
    } else if (_brewery.breweryId.intValue == 3) {
        _logoImgView.image = [UIImage imageNamed:@"devils canyon logo.png"];
    }
    _logoImgView.height = 60;
    _logoImgView.width = 60;
    _logoImgView.left = 20;
    _logoImgView.centerY = self.height / 2.0;

    _nameLabel.height = 30;
    _nameLabel.width = 100;
    _nameLabel.left = 100;
    _nameLabel.centerY = self.height / 2.0;
}

-(void) setBrewery:(RKBrewery *)brewery {
    _brewery = brewery;
    _nameLabel.text = brewery.name;
    [self setNeedsLayout];
}

@end