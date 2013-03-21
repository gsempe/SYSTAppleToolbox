//
//  NSString+SYSTExtension.m
//  SYSTAppleToolbox
//
//  Created by Guillaume Sempé on 23/07/12.
//  Copyright (c) 2012 Syst.ms. All rights reserved.
//

#import "NSString+SYSTExtension.h"
#import "NSData+SYSTExtension.h"

@implementation NSString (SYSTExtension)

+ (NSString *)getRightFormForTheAmount:(NSNumber*)amount,...
{
    NSString *eachString;
    NSString *rightString = nil;
    NSInteger rightForm = NSNotFound;
    va_list stringList;
    if(amount) {
        NSString* language =[[NSLocale preferredLanguages] objectAtIndex:0];
        NSInteger n = [amount integerValue];
        if([language isEqualToString:@"pl"]) {  //3
            rightForm = (n==1 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
        }
        //        if([language isEqualToString:@"ru"]) {    // 3
        //            rightForm = (n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
        //        }
        if(([language isEqualToString:@"fr"]) ||    // 2
           ([language isEqualToString:@"tr"]) ) {
            rightForm = (n>1 ? 1 : 0);
        }
        if(([language isEqualToString:@"en"]) ||    //2
           ([language isEqualToString:@"es"]) ||
           ([language isEqualToString:@"it"]) ||
           ([language isEqualToString:@"de"]) ||
           ([language isEqualToString:@"pt"]) ) {
            rightForm = (n!=1 ? 1 : 0);
        }
        if(([language isEqualToString:@"ja"]) ||    //1
           ([language isEqualToString:@"ko"]) ||
           ([language isEqualToString:@"zh"]) ){
            rightForm = 0;
        }
        if (NSNotFound==rightForm) {
            // Use en rule if current language has not be matched
            rightForm = (n!=1 ? 1 : 0);
        }
        NSInteger currentFormIndex = 0;
        va_start(stringList, amount); // Start scanning for arguments after quantity.
        while (nil!=(eachString = va_arg(stringList, id))) {
            if (currentFormIndex == rightForm) {
                rightString = eachString;
            }
            currentFormIndex++;
        }
        va_end(stringList);
    }    
    return rightString;
}

- (NSString *)capitalizedSentence
{
    if ([self length] >= 1) {
        return [self stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[self substringToIndex:1] capitalizedString]];
    } else {
        return self;
    }
}

-(NSString *)urlEncodeUsingEncoding:(NSStringEncoding)encoding {
	return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,
                                                               (CFStringRef)self,
                                                               NULL,
                                                               (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                               CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (BOOL)isValidEmail
{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

+ (NSString*)stringWithDeviceToken:(NSData*)deviceToken
{
    const unsigned *deviceTokenBytes = [deviceToken bytes];
    NSString *hexDeviceToken = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                                ntohl(deviceTokenBytes[0]), ntohl(deviceTokenBytes[1]), ntohl(deviceTokenBytes[2]),
                                ntohl(deviceTokenBytes[3]), ntohl(deviceTokenBytes[4]), ntohl(deviceTokenBytes[5]),
                                ntohl(deviceTokenBytes[6]), ntohl(deviceTokenBytes[7])];
    
    return hexDeviceToken;
    //    NSString* deviceTokenString = [[[[[deviceToken description]
    //                                      stringByReplacingOccurrencesOfString: @"<" withString: @""]
    //                                     stringByReplacingOccurrencesOfString: @">" withString: @""]
    //                                    stringByReplacingOccurrencesOfString: @" " withString: @""] retain];
    
}

+ (NSString *)base64Encode:(NSString *)plainText
{
    NSData *plainTextData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainTextData base64EncodedString];
    return base64String;
}

+ (NSString *)base64Decode:(NSString *)base64String
{
    NSData *plainTextData = [NSData dataFromBase64String:base64String];
    NSString *plainText = [[NSString alloc] initWithData:plainTextData encoding:NSUTF8StringEncoding];
    return plainText;
}

@end
