//
//  NSString+SYSTExtension.h
//  SYSTAppleToolbox
//
//  Created by Guillaume Sempé on 23/07/12.
//  Copyright (c) 2012 Syst.ms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SYSTExtension)

/**
 Choose the right string between the parameters regarding the amount parameter
 
 @param amount The amount of elements targeted 
 
 @discussion The second parameter must be the singular form. The 3rd parameter must be the first plural form and the 4th parameter the second plural form
 
 @return One of the strings given by parameter.
 */
+ (NSString *)getRightFormForTheAmount:(NSNumber*)amount,... NS_REQUIRES_NIL_TERMINATION;

+ (NSString*)stringWithDeviceToken:(NSData*)deviceToken;

- (NSString *)capitalizedSentence;

- (NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding;

- (BOOL)isValidEmail;

+ (NSString *)base64Encode:(NSString *)plainText;
+ (NSString *)base64Decode:(NSString *)base64String;

+ (NSString*)sha1:(NSString*)plainString;
+ (NSString *)md5:(NSString *)plainString;

/*
 Bridge the new iOS7 boundingRectWithSize:options:attributes:context: NSString method with the iOS6 sizeWithFont:constrainedToSize:lineBreakMode:
 
 Get rect containing a NSString with a specific font and constrained to a specific size
 */
- (CGRect)rectWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

@end
