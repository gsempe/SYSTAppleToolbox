//
//  NSData+SYSTExtension.h
//  FotoliaX
//
//  Created by Guillaume Sempé on 18/03/13.
//  Copyright (c) 2013 Fotolia. All rights reserved.
//

#import <Foundation/Foundation.h>

void *NewBase64Decode(
                      const char *inputBuffer,
                      size_t length,
                      size_t *outputLength);

char *NewBase64Encode(
                      const void *inputBuffer,
                      size_t length,
                      bool separateLines,
                      size_t *outputLength);

@interface NSData (SYSTExtension)

+ (NSData *)dataFromBase64String:(NSString *)aString;
- (NSString *)base64EncodedString;

@end
