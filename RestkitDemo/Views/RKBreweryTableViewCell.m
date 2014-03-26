/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBreweryTableViewCell.h"
#import "RKBrewery.h"
#import "UIView+UIViewLayoutAdditions.h"


@implementation RKBreweryTableViewCell {
    RKBrewery *_brewery;

    UILabel *_nameLabel;
}

- (id)init {
    self = [super init];
    if (self) {
        _nameLabel = [UILabel new];

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        [self addSubview:_nameLabel];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    _nameLabel.height = 30;
    _nameLabel.width = 100;
    _nameLabel.left = 20;
    _nameLabel.centerY = self.height / 2.0;
}

-(void) setBrewery:(RKBrewery *)brewery {
    _brewery = brewery;
    _nameLabel.text = brewery.name;
    [self setNeedsLayout];
}

@end