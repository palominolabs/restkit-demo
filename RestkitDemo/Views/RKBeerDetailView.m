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
    UITextView *_descriptionText;
    UILabel *_averageRatingLabel;
    UIImageView *_labelImgView;
}

- (instancetype)initWithBeer:(RKBeer *)beer {
    self = [super init];
    if (self) {
        _beer = beer;

        self.backgroundColor = [UIColor colorWithRed:212.0 / 255.0 green:215.0 / 255.0 blue:107.0 / 255.0 alpha:1.0];

        _labelImgView = [UIImageView new];

        _nameLabel = [UILabel new];
        _nameLabel.text = beer.name;
        _nameLabel.font = [UIFont systemFontOfSize:20];

        _breweryLabel = [UILabel new];
        _breweryLabel.text = @"Some Brewery";
        _breweryLabel.font = [UIFont systemFontOfSize:16];

        _descriptionText = [UITextView new];
        _descriptionText.font = [UIFont systemFontOfSize:14];
        _descriptionText.textColor = [UIColor blackColor];
        _descriptionText.text = @"The infamous Black Tuesday is an imperial stout aged in bourbon barrels for over a year. Rich caramel, toasted malt, vanilla, burnt wood and anise are just a few of the many flavors in this rich, decadent imperial stout.";
        _descriptionText.editable = NO;
        _descriptionText.layer.cornerRadius = 5;
        _descriptionText.layer.borderWidth = 2.0f;
        _descriptionText.layer.borderColor = [[UIColor blackColor] CGColor];
        _descriptionText.backgroundColor = [UIColor lightGrayColor];

        [self addSubview:_labelImgView];
        [self addSubview:_nameLabel];
        [self addSubview:_breweryLabel];
        [self addSubview:_descriptionText];
    }

    return self;
}


- (void)layoutSubviews {
    _labelImgView.size = CGSizeMake(self.width - 40, 200);
    _labelImgView.left = 20;
    _labelImgView.top = 20;
    [_labelImgView setImageWithURL:[NSURL URLWithString:@"http://thefullpint.com/wp-content/uploads/2009/10/black-tuesday.jpg"]];

    _nameLabel.width = self.width - 40;
    _nameLabel.height = 30;
    _nameLabel.left = 20;
    _nameLabel.top = _labelImgView.bottom + 10;

    _breweryLabel.width = self.width - 40;
    _breweryLabel.height = 20;
    _breweryLabel.left = 20;
    _breweryLabel.top = _nameLabel.bottom + 10;

    _descriptionText.width = self.width - 40;
    _descriptionText.height = 120;
    _descriptionText.left = 20;
    _descriptionText.top = _breweryLabel.bottom + 20;
}


@end