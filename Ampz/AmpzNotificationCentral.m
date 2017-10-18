//
//  AmpzNotificationCentral.m
//  Ampz
//
//  Created by Maximilian Täschner on 16/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "AmpzNotificationCentral.h"

NSString *const AmpzNotificationNavigate = @"AmpzNotificationNavigate";
NSString *const AmpzNavigationTargetSettings = @"AmpzNotificationNavigationTargetSettings";

@implementation AmpzNotificationCentral

+(void)navigationNotification:(id)object {
    [[self defaultCenter] postNotificationName:AmpzNotificationNavigate object:object];
}

+(NSNotificationCenter *)defaultCenter {
    return [NSNotificationCenter defaultCenter];
}

@end
