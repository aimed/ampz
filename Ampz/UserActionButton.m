//
//  UserActionButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "UserActionButton.h"
#import "ETSession.h"

@interface UserActionButton () <ETSessionStateChangeListener>
@end

@implementation UserActionButton
-(void)awakeFromNib {
    [ETSession subscribe:self];
}
-(void)dealloc {
    [ETSession unsubscribe:self];
}
-(void)sessionStateChange:(NSNotification *)aNotification {
    ETSession *session = aNotification.object;
    
    if (session != [ETSession activeSession]) {
        return;
    }
    
    [self setNeedsDisplay];
}

-(BOOL)isEnabled {
    BOOL enabled = [ETSession hasActiveSession] && [ETSession activeSession].isValid;
    return enabled;
}
@end
