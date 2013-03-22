//
//  UIImage+SYSTExtension.h
//  FotoliaX
//
//  Created by Guillaume Sempé on 25/02/13.
//  Copyright (c) 2013 Fotolia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SYSTExtension)
+ (UIImage *)decodedImageWithImage:(UIImage *)image;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
@end
