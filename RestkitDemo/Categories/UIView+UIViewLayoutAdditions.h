//
// Created by manuel on 2/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface UIView (UIViewLayoutAdditions)

- (void)removeAllSubviews;

@property (nonatomic, readwrite) CGSize size;
@property (nonatomic, readwrite) CGPoint origin;

@property (nonatomic, readwrite) CGFloat top;
@property (nonatomic, readwrite) CGFloat left;
@property (nonatomic, readwrite) CGFloat width;
@property (nonatomic, readwrite) CGFloat height;
@property (nonatomic, readwrite) CGFloat right;
@property (nonatomic, readwrite) CGFloat bottom;
@property (nonatomic, readwrite) CGFloat centerX;
@property (nonatomic, readwrite) CGFloat centerY;
@property (nonatomic, readwrite) CGFloat halfWidth;
@property (nonatomic, readwrite) CGFloat halfHeight;
@property (nonatomic, readonly) CGFloat boundsWidth;
@property (nonatomic, readonly) CGFloat boundsHeight;

@end