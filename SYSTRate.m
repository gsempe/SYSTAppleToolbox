//
//  SYSTRate.m
//  mention
//
//  Created by Guillaume Sempé on 19/07/13.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import "SYSTRate.h"

static NSString *const SYSTRateLastVersionUsedKey = @"SYSTRateLastVersionUsed";
static NSString *const SYSTRateFirstUsedKey = @"SYSTRateFirstUsed";
static NSString *const SYSTRateUseCountKey = @"SYSTRateUseCount";
static NSString *const SYSTRateEventCountKey = @"SYSTRateEventCount";
static NSString *const SYSTRateLastRemindedKey = @"SYSTRateLastReminded";

@interface SYSTRate ()

@property (nonatomic, copy) NSString *appStoreCountry;
@property (nonatomic, copy) NSString *applicationName;
@property (nonatomic, copy) NSString *applicationVersion;
@property (nonatomic, copy) NSString *applicationBundleID;

@property (nonatomic, assign) BOOL displayAppUsingStorekitIfAvailable;
@property (nonatomic, assign) BOOL previewMode;

@end

@implementation SYSTRate

+ (SYSTRate *)sharedInstance
{
    static SYSTRate *sharedInstance = nil;
    if (sharedInstance == nil)
    {
        sharedInstance = [[SYSTRate alloc] init];
    }
    return sharedInstance;
}

#pragma mark - Private methods

- (SYSTRate *)init
{
    if ((self = [super init]))
    {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationWillEnterForeground:)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
        //get country
        self.appStoreCountry = [(NSLocale *)[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
        
        //application version (use short version preferentially)
        self.applicationVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
        if ([self.applicationVersion length] == 0)
        {
            self.applicationVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
        }
        
        //localised application name
        self.applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
        if ([self.applicationName length] == 0)
        {
            self.applicationName = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
        }
        
        //bundle id
        self.applicationBundleID = [[NSBundle mainBundle] bundleIdentifier];
        
        //default settings
        self.promptAgainForEachNewVersion = YES;
        self.onlyPromptIfLatestVersion = YES;
        self.displayAppUsingStorekitIfAvailable = YES;
        
        self.previewMode = NO;
        
        self.usesUntilPrompt = 10;
        self.eventsUntilPrompt = 10;
        self.daysUntilPrompt = 10.0f;
        self.remindPeriod = 1.0f;
        
        //app launched
        [self performSelectorOnMainThread:@selector(applicationLaunched) withObject:nil waitUntilDone:NO];
    }
    return self;
}

- (void)applicationLaunched
{
    //check if this is a new version
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![[defaults objectForKey:SYSTRateLastVersionUsedKey] isEqualToString:self.applicationVersion]) {
        //reset counts
        [defaults setObject:self.applicationVersion forKey:SYSTRateLastVersionUsedKey];
        [defaults setObject:[NSDate date] forKey:SYSTRateFirstUsedKey];
        [defaults setInteger:0 forKey:SYSTRateUseCountKey];
        [defaults setInteger:0 forKey:SYSTRateEventCountKey];
        [defaults setObject:nil forKey:SYSTRateLastRemindedKey];
        [defaults synchronize];
        
    }
    
//    [self incrementUseCount];
//    if (self.promptAtLaunch && [self shouldPromptForRating])
//    {
//        [self promptIfNetworkAvailable];
//    }
}

@end
