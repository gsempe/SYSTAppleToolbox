//
//  UIColor+SYSTExtension.h
//  mention
//
//  Created by Guillaume Sempé on 07/06/13.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SYSTExtension)

+ (UIColor *)colorWithHex:(UInt32)hexadecimal;
+ (UIColor *)colorWithHexString:(NSString *)hexadecimal;

@end
