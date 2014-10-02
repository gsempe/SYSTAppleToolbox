//
//  UIDevice+SYSTExtension.m
//  mention
//
//  Created by Guillaume Sempé on 08/10/12.
//  Copyright (c) 2012 syst.ms. All rights reserved.
//

#import "UIDevice+SYSTExtension.h"

#define SYSTDeviceTypeiPhoneMask    (systDeviceTypeiPhone|systDeviceTypeiPhoneRetina|systDeviceTypeiPhone5|systDeviceTypeiPhone6|systDeviceTypeiPhone6Plus)
#define SYSTDeviceTypeiPadMask      (systDeviceTypeiPad|systDeviceTypeiPadRetina)

@implementation UIDevice (SYSTExtension)

+ (SYSTDeviceType)deviceType
{
    SYSTDeviceType deviceType = systDeviceTypeUnknown;
    UIScreen *mainScreen = [UIScreen mainScreen];
    
    CGFloat scale;
    if ([mainScreen respondsToSelector:@selector(nativeScale)]) {
        scale = mainScreen.nativeScale;
    } else {
        scale = mainScreen.scale;
    }
    
    CGFloat pixelHeight;
    if ([mainScreen respondsToSelector:@selector(nativeBounds)]) {
        // nativeBounds is bounds in pixels and not in points like bounds, so don't multiply it by scale
        pixelHeight = (CGRectGetHeight(mainScreen.nativeBounds));
    } else {
        pixelHeight = (CGRectGetHeight(mainScreen.bounds) * scale);
    }

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if (scale == 3.0f) {
            // pixelHeight should be 2208 but can be 1704 if the app is running in iOS8 compatibility mode (scale up)
            // In both cases we do not care for now, iPhone6+ is the only device with nativeScale @3x
            deviceType = systDeviceTypeiPhone6Plus;
        } else if (scale == 2.0f) {
            if (pixelHeight == 960.0f) {
                deviceType = systDeviceTypeiPhoneRetina;
            } else if (pixelHeight == 1136.0f) {
                deviceType = systDeviceTypeiPhone5; // iPhone 6 in iOS8 compatibility mode is detected as an iPhone 5
            } else if (pixelHeight == 1334.0f) {
                deviceType = systDeviceTypeiPhone6;
            }
        } else if (scale == 1.0f && pixelHeight == 480.0f) {
            deviceType = systDeviceTypeiPhone;
        }
    } else {
        if (scale == 2.0f && pixelHeight == 2048.0f) {
            deviceType = systDeviceTypeiPadRetina;
        } else if (scale == 1.0f && pixelHeight == 1024.0f) {
            deviceType = systDeviceTypeiPad;
        }
    }
    
    return deviceType;
}

+ (BOOL)isDeviceiPad
{
    BOOL isiPad = NO;
    if (0!=([UIDevice deviceType]&SYSTDeviceTypeiPadMask)) {
        isiPad = YES;
    }
    return isiPad;
}

+ (BOOL)isDeviceiPhone
{
    BOOL isiPhone = NO;
    if (0!=([UIDevice deviceType]&SYSTDeviceTypeiPhoneMask)) {
        isiPhone = YES;
    }
    return isiPhone;
}

@end
