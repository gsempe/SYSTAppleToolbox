//
//  NSURL+SYSTExtension.h
//  mention
//
//  Created by Guillaume Sempé on 18/04/13.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (SYSTExtension)

+ (NSURL*)gravatarURLForEmailAddress:(NSString*)emailAddress
                                size:(CGSize)size;
@end
