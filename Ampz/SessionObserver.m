//
//  SessionObserver.m
//  Ampz
//
//  Created by Maximilian Täschner on 18/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "SessionObserver.h"
#import "ETUser.h"

static NSMutableSet *_sessionObservers;
static SessionObserver *_observerInstance;

@interface SessionObserver () <ETSessionStateChangeListener>
@end

@implementation SessionObserver

#pragma mark Instance

-(instancetype)init {
    self = [super init];
    if (self)
    {
        [ETSession subscribe:self];
    }
    return self;
}

-(void)dealloc {
    [ETSession unsubscribe:self];
}

-(void)sessionStateChange:(NSNotification *)aNotification {
    ETSession *session = aNotification.object;
    if (session == nil || session != [ETSession activeSession])
    {
        return;
    }
    
    // notify observers
    
    if (session.state == ETSessionStateTokenCreated)
    {
        for (id<SessionObserverDelegate>delegate in _sessionObservers)
        {
            [delegate sessionInitialized:session];
        }
    }
    else if (session.isValid && session.user)
    {
        for (id<SessionObserverDelegate>delegate in _sessionObservers)
        {
            [delegate sessionValidated:session];
        }
    }
    else if (session.state == ETSessionStateTokenInvalid || session.state == ETSessionStateDisabled)
    {
        for (id<SessionObserverDelegate>delegate in _sessionObservers)
        {
            [delegate sessionInvalidated:session];
        }
    }
}

#pragma mark Static

+(void)initialize {
    _sessionObservers = [NSMutableSet new];
    _observerInstance = [SessionObserver new];
}

+(void)subscribe:(id<SessionObserverDelegate>)observer {
    [_sessionObservers addObject:observer];
}

+(void)unsubscribe:(id)observer {
    [_sessionObservers removeObject:observer];
}

+(BOOL)hasSession {
    return [ETSession activeSession] && [ETSession activeSession].state >= ETSessionStateTokenCreated;
}

@end
