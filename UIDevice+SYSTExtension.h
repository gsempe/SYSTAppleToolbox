//
//  UIDevice+SYSTExtension.h
//  mention
//
//  Created by Guillaume Sempé on 08/10/12.
//  Copyright (c) 2012 syst.ms. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    systDeviceTypeUnknown         = 1 << 0,
    systDeviceTypeiPhone          = 1 << 1,
    systDeviceTypeiPhoneRetina    = 1 << 2,
    systDeviceTypeiPhone5         = 1 << 3,
    systDeviceTypeiPad            = 1 << 4,
    systDeviceTypeiPadRetina      = 1 << 5
} SYSTDeviceType;

@interface UIDevice (SYSTExtension)
+ (SYSTDeviceType)deviceType;
@end
