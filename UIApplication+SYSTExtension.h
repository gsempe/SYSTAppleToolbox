//
//  UIApplication+SYSTExtension.h
//  mention
//
//  Created by Guillaume Sempé on 26/11/2013.
//  Copyright (c) 2013 syst.ms. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (SYSTExtension)

/*
 Proxy to get the abracadabra bar
 */
+ (UIView *)abracadabraBar;

+ (BOOL)areNotificationsEnabled;

/*
 Application state
 */
- (BOOL)isRunningInBackground;
- (BOOL)isRunningInForeground;

/*
 Base window
 */
@property (nonatomic, readonly) UIView *baseWindowView;
- (void)addWindowOverlay:(UIView *)view;

@end
