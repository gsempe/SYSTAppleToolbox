//
//  UIApplication+SYSTExtension.m
//  mention
//
//  Created by Guillaume Sempé on 26/11/2013.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import "UIApplication+SYSTExtension.h"

@implementation UIApplication (SYSTExtension)

+ (UIView *)abracadabraBar
{
    /*
     Condition test extract from SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO macro of UIDevice category
     */
    if ([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending) {
        UIApplication *app = [UIApplication sharedApplication];
        const int l = 10;
        char c[l] = "rs`strA`q\0";
        char d[l];
        for (int i = 0; i < l-1; i++) {
            d[i] = c[i]+1;
        }
        d[l-1] = '\0';
        NSString *k = [NSString stringWithCString:d encoding:NSASCIIStringEncoding];
        return (UIView *)[app valueForKey:k];
    } else {
        return nil;
    }
}

+ (void)enableNotifications
{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8")) {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    } else {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                                               UIRemoteNotificationTypeAlert |
                                                                               UIRemoteNotificationTypeSound)];
    }
}

+ (BOOL)areNotificationsEnabled
{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8")) {
        return [[UIApplication sharedApplication] isRegisteredForRemoteNotifications];
    } else {
        UIRemoteNotificationType types = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        if (types&UIRemoteNotificationTypeAlert) {
            return YES;
        } else {
            return NO;
        }
        
    }
}

/*
 Application state
 */
- (BOOL)isRunningInBackground
{
    UIApplicationState state = self.applicationState;
    return state == UIApplicationStateBackground;
}

- (BOOL)isRunningInForeground
{
    UIApplicationState state = self.applicationState;
    return state == UIApplicationStateActive;
}

/*
 Base window
 */
- (UIView *)baseWindowView{
    if (self.keyWindow.subviews.count > 0){
        return [self.keyWindow.subviews objectAtIndex:0];
    }
    return nil;
}

- (void)addWindowOverlay:(UIView *)view{
    [self.baseWindowView addSubview:view];
}

@end
