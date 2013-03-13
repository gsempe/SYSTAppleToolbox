//
//  UIView+SYSTExtension.m
//  FotoliaX
//
//  Created by Guillaume Sempé on 11/03/13.
//  Copyright (c) 2013 Fotolia. All rights reserved.
//

#import "UIView+SYSTExtension.h"

@implementation UIView (SYSTExtension)

- (CGFloat)xScale
{
    CGAffineTransform t = self.transform;
    return sqrt(t.a * t.a + t.c * t.c);
}

- (CGFloat)yScale
{
    CGAffineTransform t = self.transform;
    return sqrt(t.b * t.b + t.d * t.d);
}

- (CGFloat)rotation
{
    CGAffineTransform t = self.transform;
    return atan2f(t.b, t.a);
}

- (CGFloat)tx
{
    CGAffineTransform t = self.transform;
    return t.tx;
}

- (CGFloat)ty
{
    CGAffineTransform t = self.transform;
    return t.ty;
}

////////////

// Coordinate utilities
- (CGPoint) offsetPointToParentCoordinates: (CGPoint) aPoint
{
    return CGPointMake(aPoint.x + self.center.x,
                       aPoint.y + self.center.y);
}

- (CGPoint) pointInViewCenterTerms: (CGPoint) aPoint
{
    return CGPointMake(aPoint.x - self.center.x,
                       aPoint.y - self.center.y);
}

- (CGPoint) pointInTransformedView: (CGPoint) aPoint
{
    CGPoint offsetItem = [self pointInViewCenterTerms:aPoint];
    CGPoint updatedItem = CGPointApplyAffineTransform(
                                                      offsetItem, self.transform);
    CGPoint finalItem =
    [self offsetPointToParentCoordinates:updatedItem];
    return finalItem;
}

- (CGRect) originalFrame
{
    CGAffineTransform currentTransform = self.transform;
    self.transform = CGAffineTransformIdentity;
    CGRect originalFrame = self.frame;
    self.transform = currentTransform;
    
    return originalFrame;
}

// These four methods return the positions of view elements
// with respect to the current transform

- (CGPoint) transformedTopLeft
{
    CGRect frame = self.originalFrame;
    CGPoint point = frame.origin;
    return [self pointInTransformedView:point];
}

- (CGPoint) transformedTopRight
{
    CGRect frame = self.originalFrame;
    CGPoint point = frame.origin;
    point.x += frame.size.width;
    return [self pointInTransformedView:point];
}

- (CGPoint) transformedBottomRight
{
    CGRect frame = self.originalFrame;
    CGPoint point = frame.origin;
    point.x += frame.size.width;
    point.y += frame.size.height;
    return [self pointInTransformedView:point];
}

- (CGPoint) transformedBottomLeft
{
    CGRect frame = self.originalFrame;
    CGPoint point = frame.origin;
    point.y += frame.size.height;
    return [self pointInTransformedView:point];
}

@end
