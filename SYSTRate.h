//
//  SYSTRate.h
//  mention
//
//  Created by Guillaume Sempé on 19/07/13.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 !!!!!!!!!!
 Add [[NSUserDefaults standardUserDefaults] synchronize] to applicationDidEnterBackground
 Without it SYSTRate will not work
 !!!!!!!!!!
 */
@interface SYSTRate : NSObject

+ (SYSTRate *)sharedInstance;

@property (nonatomic, assign) BOOL promptAgainForEachNewVersion;
@property (nonatomic, assign) BOOL onlyPromptIfLatestVersion;

@property (nonatomic, assign) NSUInteger usesUntilPrompt;
@property (nonatomic, assign) NSUInteger eventsUntilPrompt;
@property (nonatomic, assign) float daysUntilPrompt;
@property (nonatomic, assign) float remindPeriod;

@end
