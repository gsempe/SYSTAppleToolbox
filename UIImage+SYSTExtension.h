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
/*
 Fix image orientation problems by changing it to UIImageOrientationUp whatever the orientation of image
 */
+ (UIImage *)normalizeImage:(UIImage *)image;
+ (UIImage *)rotateImage:(UIImage *)image byDegreeRotation:(CGFloat)degreeRotation;
+ (UIImage *)rotateImage:(UIImage *)image withTransformation:(CGAffineTransform)rotationTransformation;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/*
 From http://robots.thoughtbot.com/post/46668544473/designing-for-ios-blending-modes
 */

/*
 Tint a flat image
 */
- (UIImage *)tintedImageWithColor:(UIColor *)tintColor;
- (UIImage *)tintedGradientImageWithColor:(UIColor *)tintColor;

- (UIImage *)overlayImageWithColor:(UIColor *)color;
@end
