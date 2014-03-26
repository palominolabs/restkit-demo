/*
 * Copyright (c) 2013 Palomino Labs, Inc.
 */

#import "RKBeerFooterView.h"
#import "UIView+UIViewLayoutAdditions.h"


@implementation RKBeerFooterView {
    UIImageView *_buttonImgView;
}

- (id)init {
    self = [super init];
    if (self) {
        UIImage *buttonImg = [UIImage imageNamed:@"tabButtons"];
        _buttonImgView = [[UIImageView alloc] initWithImage:buttonImg];

        [self addSubview:_buttonImgView];
    }

    return self;
}

- (void)layoutSubviews {
    _buttonImgView.height = 50;
    _buttonImgView.width = self.width;
    _buttonImgView.left = 0;
    _buttonImgView.bottom = self.height;
}


@end