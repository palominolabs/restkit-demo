/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerTableViewCell.h"
#import "RKBeer.h"
#import "UIView+UIViewLayoutAdditions.h"


@implementation RKBeerTableViewCell {
    RKBeer *_beer;

    UILabel *_nameLabel;
}

- (id)init {
    self = [super init];
    if (self) {
        _nameLabel = [UILabel new];
        _nameLabel.textColor = [UIColor redColor];

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


-(void) setBeer:(RKBeer *)beer {
    _beer = beer;
    _nameLabel.text = beer.name;
    [self setNeedsLayout];
}

@end