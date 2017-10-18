//
//  AmpzNotificationCentral.h
//  Ampz
//
//  Created by Maximilian Täschner on 16/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const AmpzNotificationNavigate;
extern NSString *const AmpzNavigationTargetSettings;

@interface AmpzNotificationCentral : NSObject
+(void)navigationNotification:(id)object;
+(NSNotificationCenter *)defaultCenter;
@end
