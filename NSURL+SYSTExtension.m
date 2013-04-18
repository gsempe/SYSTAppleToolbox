//
//  NSURL+SYSTExtension.m
//  mention
//
//  Created by Guillaume Sempé on 18/04/13.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import "NSURL+SYSTExtension.h"
#import <CommonCrypto/CommonDigest.h>

NSString * const SYSTGravatarBaseURLString = @"https://secure.gravatar.com/avatar/";

typedef enum {
    KHGravatarDefaultImageDefault = 0,
    KHGravatarDefaultImage404,
    KHGravatarDefaultImageMysteryMan,
    KHGravatarDefaultImageIdenticon,
    KHGravatarDefaultImageMonsterId,
    KHGravatarDefaultImageWavatar,
    KHGravatarDefaultImageRetro,
}KHGravatarDefaultImage;

typedef enum {
    KHGravatarRatingG = 0,
    KHGravatarRatingPG,
    KHGravatarRatingR,
    KHGravatarRatingX,
}KHGravatarRating;

static NSString * SYSTGravatarHashForEmailAddress(NSString *emailAddress) {
    emailAddress = [emailAddress stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    emailAddress = [emailAddress lowercaseString];
    
    const char *cStr = [emailAddress UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    NSString* md5EmailAddress =  [NSString stringWithFormat:
                                  @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                                  result[0], result[1], result[2], result[3],
                                  result[4], result[5], result[6], result[7],
                                  result[8], result[9], result[10], result[11],
                                  result[12], result[13], result[14], result[15]
                                  ];
    return [md5EmailAddress lowercaseString];
}

static NSString* SYSTGravatarRatingStringForRating(KHGravatarRating rating){
    NSString * ratingString = nil;
    switch (rating) {
        case KHGravatarRatingG:
            ratingString = @"g";
            break;
        case KHGravatarRatingPG:
            ratingString = @"pg";
            break;
        case KHGravatarRatingR:
            ratingString = @"r";
            break;
        case KHGravatarRatingX:
            ratingString = @"x";
        default:
            break;
    }
    return ratingString;
}

@implementation NSURL (SYSTExtension)

+ (NSURL*)gravatarURLForEmailAddress:(NSString*)emailAddress
                                size:(CGSize)size
{
    return [self gravatarURLForEmailAddress:emailAddress defaultImageType:KHGravatarDefaultImage404 rating:KHGravatarRatingX size:size];
}

/*
 From UIImageView+KHGravatar.h
 */
#pragma mark - Gravatar Stuff

+ (NSURL*)gravatarURLForEmailAddress:(NSString*)emailAddress
                    defaultImageType:(KHGravatarDefaultImage)defaultImageType
                              rating:(KHGravatarRating)rating
                                size:(CGSize)size
{
    NSString *emailHash = SYSTGravatarHashForEmailAddress(emailAddress);
    CGFloat imageSize = [[UIScreen mainScreen] scale] * MAX(size.width, size.height);
    imageSize = MIN(imageSize,512);
    NSString * urlString = [NSString stringWithFormat:@"%@%@.png?s=%0.0f",SYSTGravatarBaseURLString,emailHash,imageSize];
    
    if(defaultImageType!=KHGravatarDefaultImageDefault){
        NSString * type = nil;
        switch (defaultImageType) {
            case KHGravatarDefaultImage404:
                type = @"404";
                break;
            case KHGravatarDefaultImageMysteryMan:
                type = @"mm";
                break;
            case KHGravatarDefaultImageIdenticon:
                type = @"identicon";
                break;
            case KHGravatarDefaultImageMonsterId:
                type = @"monsterid";
                break;
            case KHGravatarDefaultImageWavatar:
                type = @"wavatar";
                break;
            case KHGravatarDefaultImageRetro:
                type = @"retro";
                break;
            default:
                break;
        }
        if(type){
            urlString = [urlString stringByAppendingFormat:@"&d=%@",type];
        }
    }
    
    NSString * ratingString = SYSTGravatarRatingStringForRating(rating);
    if(ratingString){
        urlString = [urlString stringByAppendingFormat:@"&r=%@",ratingString];
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    return url;
}

@end
