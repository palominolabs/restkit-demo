/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerDetailView.h"
#import "RKBeer.h"
#import "UIView+UIViewLayoutAdditions.h"


@implementation RKBeerDetailView {
    RKBeer *_beer;

    UILabel *_nameLabel;
    UILabel *_breweryLabel;
    UITextField *_descriptionText;
    UILabel *_averageRatingLabel;
}

- (instancetype)initWithBeer:(RKBeer *)beer {
    self = [super init];
    if (self) {
        _beer = beer;

        _nameLabel = [UILabel new];
        _nameLabel.text = beer.name;
        _nameLabel.font = [UIFont systemFontOfSize:20];

        [self addSubview:_nameLabel];
    }

    return self;
}


- (void)layoutSubviews {
    _nameLabel.width = self.width - 40;
    _nameLabel.height = 40;
    _nameLabel.left = 20;
    _nameLabel.top = 20;
}


@end