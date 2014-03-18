//
// Created by manuel on 2/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//



@implementation UIView (UIViewLayoutAdditions)

- (void)removeAllSubviews {
    while (self.subviews.count) {
        [self.subviews[0] removeFromSuperview];
    }
}


- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    self.frame = CGRectIntegral(CGRectMake(self.left, self.top, size.width, size.height));
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    self.frame = CGRectIntegral(CGRectMake(origin.x, origin.y, self.width, self.height));
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top {
    self.origin = CGPointMake(self.left, top);
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left {
    self.origin = CGPointMake(left, self.top);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    self.size = CGSizeMake(width, self.height);
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    self.size = CGSizeMake(self.width, height);
}

- (CGFloat)right {
    return self.left + self.boundsWidth;
}

- (void)setRight:(CGFloat)right {
    self.left = right - self.boundsWidth;
}

- (CGFloat)bottom {
    return self.top + self.boundsHeight;
}

- (void)setBottom:(CGFloat)bottom {
    self.top = bottom - self.boundsHeight;
}

- (CGFloat)centerX {
    return self.left + self.halfWidth;
}

- (void)setCenterX:(CGFloat)centerX {
    self.left = centerX - self.halfWidth;
}

- (CGFloat)centerY {
    return self.top + self.halfHeight;
}

- (void)setCenterY:(CGFloat)centerY {
    self.top = centerY - self.halfHeight;
}

- (CGFloat)halfWidth {
    return self.boundsWidth / 2;
}

- (void)setHalfWidth:(CGFloat)halfWidth {
    self.width = halfWidth * 2;
}

- (CGFloat)halfHeight {
    return self.boundsHeight / 2;
}

- (void)setHalfHeight:(CGFloat)halfHeight {
    self.height = halfHeight * 2;
}

-(CGFloat)boundsWidth {
    return self.bounds.size.width;
}

-(CGFloat)boundsHeight {
    return self.bounds.size.height;
}

@end