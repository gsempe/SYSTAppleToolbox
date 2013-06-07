//
//  UIColor+SYSTExtension.m
//  mention
//
//  Created by Guillaume Sempé on 07/06/13.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import "UIColor+SYSTExtension.h"

@implementation UIColor (SYSTExtension)

+ (UIColor *)colorWithHex:(UInt32)hexadecimal
{
	CGFloat red, green, blue;
    
	// bitwise AND operation
	// hexadecimal's first 2 values
	red = ( hexadecimal >> 16 ) & 0xFF;
	// hexadecimal's 2 middle values
	green = ( hexadecimal >> 8 ) & 0xFF;
	// hexadecimal's last 2 values
	blue = hexadecimal & 0xFF;
    
	UIColor *color = [UIColor colorWithRed: red / 255.0f green: green / 255.0f blue: blue / 255.0f alpha: 1.0f];
	return color;
}

+ (UIColor *)colorWithHexString:(NSString *)hexadecimal
{
	// convert Objective-C NSString to C string
	const char *cString = [hexadecimal cStringUsingEncoding: NSASCIIStringEncoding];
	long int hex;
    
	// if the string contains hash tag (#) then remove
	// hash tag and convert the C string to a base-16 int
	if ( cString[0] == '#' )
	{
		hex = strtol(cString + 1, NULL, 16);
	}
	else
	{
		hex = strtol(cString, NULL, 16);
	}
    
	UIColor *color = [self colorWithHex: hex];
	return color;
}

@end
