/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerTableViewCell.h"
#import "RKBeer.h"
#import "UIView+UIViewLayoutAdditions.h"


@implementation RKBeerTableViewCell {
    RKBeer *_beer;

    UILabel *_nameLabel;
    UILabel *_ratingLabel;
    UIImageView *_ratingImgView;
}

- (id)init {
    self = [super init];
    if (self) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont boldSystemFontOfSize:20];

        _ratingLabel = [UILabel new];
        _ratingLabel.text = @"Not rated...";
        _ratingLabel.font = [UIFont systemFontOfSize:12];
        _ratingLabel.hidden = YES;

        _ratingImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star rating"]];
        _ratingImgView.hidden = YES;

        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        [self addSubview:_nameLabel];
        [self addSubview:_ratingLabel];
        [self addSubview:_ratingImgView];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    _nameLabel.text = _beer.name;
    _nameLabel.height = 30;
    _nameLabel.width = 100;
    _nameLabel.left = 20;
    _nameLabel.top = 10;

    _ratingLabel.height = 30;
    _ratingLabel.width = 100;
    _ratingLabel.left = 20;
    _ratingLabel.top = 40;

    [_ratingImgView sizeToFit];
    _ratingImgView.top = 40;
    _ratingImgView.left = 20;

    if (_beer.beerId.intValue == 2) {
        _ratingLabel.hidden = YES;
        _ratingImgView.hidden = NO;
    } else {
        _ratingLabel.hidden = NO;
        _ratingImgView.hidden = YES;
    }
}


-(void) setBeer:(RKBeer *)beer {
    _beer = beer;
    _nameLabel.text = beer.name;
    [self setNeedsLayout];
}

@end