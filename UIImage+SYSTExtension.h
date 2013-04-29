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
@end
