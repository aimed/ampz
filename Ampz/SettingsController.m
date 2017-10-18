//
//  SettingsController.m
//  Ampz
//
//  Created by Maximilian Täschner on 08/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "SettingsController.h"
#import "ETSession.h"
#import "ErrorController.h"

@interface SettingsController () <ETSessionStateChangeListener>
@end

@implementation SettingsController {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [ETSession subscribe:self];
    if ([ETSession hasActiveSession])
    {
        [self sessionStateChange:nil];
    }
}

-(void)dealloc {
    [ETSession unsubscribe:self];
}

-(void)changeLoginState:(id)sender {
    ETSession *session = [ETSession activeSession];
    // logout
    if (session && [[ETSession activeSession] isValid]) {
        [session setSessionState:ETSessionStateDisabled];
    // login
    } else {
        session = [[ETSession alloc] init];
        [ETSession setActiveSession:session];
        [session authorizeWithUsername:_usernameField.stringValue
                           andPassword:_passwordField.stringValue
                              complete:^(NSError *err, ETSession *session)
        {
            if (err)
            {
                [ErrorController showError:err];
            }
        }];
    }
}

-(void)sessionStateChange:(NSNotification *)aNotification {
    ETSession *session = [ETSession activeSession];
    
    if (session == nil) {
        NSLog(@"Session for sessionStateChange is nil.");
        return;
    }
    
    BOOL isLoggedIn = [session isValid];
    [_usernameField setEnabled:!isLoggedIn];
    [_passwordField setEnabled:!isLoggedIn];
    [_loginButton setTitle:isLoggedIn ? @"Sign out" : @"Sign in"];
    
    switch (session.state) {
        case ETSessionStateEmpty:
            break;
        case ETSessionStateDisabled:
            break;
        case ETSessionStateTokenInvalid:
            break;
        case ETSessionStateTokenCreated:
            break;
        case ETSessionStateTokenValid:
            break;
    }
}

-(void)representPageItemEmpty:(PageItem *)pageItem
{
    
}

-(void)representPageItemWithData:(PageItem *)pageItem
{
    
}

@end
