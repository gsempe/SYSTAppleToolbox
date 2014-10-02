//
//  UIDevice+SYSTExtension.h
//  mention
//
//  Created by Guillaume Sempé on 08/10/12.
//  Copyright (c) 2012 syst.ms. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

typedef enum
{
    systDeviceTypeUnknown         = 1 << 0,
    systDeviceTypeiPhone          = 1 << 1,
    systDeviceTypeiPhoneRetina    = 1 << 2,
    systDeviceTypeiPhone5         = 1 << 3,
    systDeviceTypeiPhone6         = 1 << 4,
    systDeviceTypeiPhone6Plus     = 1 << 5,
    systDeviceTypeiPad            = 1 << 6,
    systDeviceTypeiPadRetina      = 1 << 7
} SYSTDeviceType;

@interface UIDevice (SYSTExtension)
+ (SYSTDeviceType)deviceType;
+ (BOOL)isDeviceiPad;
+ (BOOL)isDeviceiPhone;
@end
