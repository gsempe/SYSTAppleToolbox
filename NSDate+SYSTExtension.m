//
//  NSDate+SYSTExtension.m
//  mention
//
//  Created by Guillaume Sempé on 13/02/13.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import "NSDate+SYSTExtension.h"

@interface NSDate (SYSTExtensionPrivate)
+ (void)zeroOutTimeComponents:(NSDateComponents **)components;
@end

@implementation NSDate (SYSTExtension)

+ (NSDate *)firstDayOfMonthFromDate:(NSDate *)date
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    // Start out by getting just the year, month and day components of the current date.
    NSDateComponents *components = [gregorianCalendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit
                                                        fromDate:date];
    
    // Change the Day component to 1 (for the first day of the month), and zero out the time components.
    [components setDay:1];
    [self zeroOutTimeComponents:&components];
    
    return [gregorianCalendar dateFromComponents:components];
}

+ (NSDate *)firstDayOfNextMonthFromDate:(NSDate *)date
{
    NSDate *firstDayOfMonth = [self firstDayOfMonthFromDate:date];
    
    // Set up a "plus 1 month" component.
    NSDateComponents *plusOneMonthComponent = [[NSDateComponents alloc] init];
	[plusOneMonthComponent setMonth:1];
    
    // Add 1 month to firstDayOfMonth.
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [gregorianCalendar dateByAddingComponents:plusOneMonthComponent
                                              toDate:firstDayOfMonth
                                             options:0];
}

+ (void)zeroOutTimeComponents:(NSDateComponents **)components {
    [*components setHour:0];
    [*components setMinute:0];
    [*components setSecond:0];
}

@end
