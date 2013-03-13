//
//  UIView+SYSTExtension.h
//  FotoliaX
//
//  Created by Guillaume Sempé on 11/03/13.
//  Copyright (c) 2013 Fotolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SYSTExtension)

- (CGFloat)xScale;

- (CGFloat)yScale;

- (CGFloat)rotation;

- (CGFloat)tx;

- (CGFloat)ty;

- (CGRect) originalFrame;

@end
