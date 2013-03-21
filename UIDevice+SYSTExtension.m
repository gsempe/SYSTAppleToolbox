//
//  UIDevice+SYSTExtension.m
//  mention
//
//  Created by Guillaume Sempé on 08/10/12.
//  Copyright (c) 2012 syst.ms. All rights reserved.
//

#import "UIDevice+SYSTExtension.h"

#define SYSTDeviceTypeiPhoneMask    (systDeviceTypeiPhone|systDeviceTypeiPhoneRetina|systDeviceTypeiPhone5)
#define SYSTDeviceTypeiPadMask      (systDeviceTypeiPad|systDeviceTypeiPadRetina)

@implementation UIDevice (SYSTExtension)

+ (SYSTDeviceType)deviceType
{
    SYSTDeviceType deviceType = systDeviceTypeUnknown;
    UIScreen *mainScreen = [UIScreen mainScreen];
    CGFloat scale = ([mainScreen respondsToSelector:@selector(scale)] ? mainScreen.scale : 1.0f);
    CGFloat pixelHeight = (CGRectGetHeight(mainScreen.bounds) * scale);
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if (scale == 2.0f) {
            if (pixelHeight == 960.0f)
                deviceType = systDeviceTypeiPhoneRetina;
            else if (pixelHeight == 1136.0f)
                deviceType = systDeviceTypeiPhone5;
            
        } else if (scale == 1.0f && pixelHeight == 480.0f)
            deviceType = systDeviceTypeiPhone;
        
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
