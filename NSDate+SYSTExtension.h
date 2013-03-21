//
//  NSDate+SYSTExtension.h
//  mention
//
//  Created by Guillaume Sempé on 13/02/13.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SYSTExtension)

+ (NSDate *)firstDayOfMonthFromDate:(NSDate *)date;
+ (NSDate *)firstDayOfNextMonthFromDate:(NSDate *)date;
@end
