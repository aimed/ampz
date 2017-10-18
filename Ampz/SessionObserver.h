//
//  SessionObserver.h
//  Ampz
//
//  Created by Maximilian Täschner on 18/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ETSession.h"

@class ETSession;
@protocol SessionObserverDelegate <NSObject>
-(void)sessionInitialized:(ETSession *)session;
-(void)sessionValidated:(ETSession *)session;
-(void)sessionInvalidated:(ETSession *)session;
@end

@interface SessionObserver : NSObject
+(void)subscribe:(id<SessionObserverDelegate>)observer;
+(void)unsubscribe:(id)observer;
+(BOOL)hasSession;
@end
