//
//  AppDelegate.m
//  Ampz
//
//  Created by Maximilian Täschner on 02/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "AppDelegate.h"
#import "AmpzNotificationCentral.h"
#import "ETSession.h"
#import "Ampz-Swift.h"

NSString *const kUserDefaultsIdentifierToken = @"USER_TOKEN";
NSString *const kAPI_KEY = @"";
NSString *const kAmpzURLPrefix = @"ampz://";

@interface AppDelegate () <ETSessionStateChangeListener>
@end

@implementation AppDelegate {
}

-(void)applicationWillFinishLaunching:(NSNotification *)notification
{
    // register for urls
    [[NSAppleEventManager sharedAppleEventManager]
     setEventHandler:self
     andSelector:@selector(handleAppleEvent:withReplyEvent:)
     forEventClass:kInternetEventClass
     andEventID:kAEGetURL
     ];
}

- (void)handleAppleEvent:(NSAppleEventDescriptor *)event
          withReplyEvent:(NSAppleEventDescriptor *)replyEvent
{
    // handle ampz:// urls
    NSString *urlString = [[event paramDescriptorForKeyword:keyDirectObject] stringValue];
    // do something with the URL string
    if (![urlString hasPrefix:kAmpzURLPrefix])
    {
        return;
    }
    
    NSString *urlWithoutPrefix = [urlString
                                  stringByReplacingOccurrencesOfString:kAmpzURLPrefix
                                  withString:@""
                                  ];
    NSArray *segments = [urlWithoutPrefix componentsSeparatedByString:@"/"];
    if (segments.count < 2)
    {
        return;
    }
    
    // handle smart ids
    if ([[segments objectAtIndex:0] isEqualToString:@"smartID"])
    {
        ETSmartID *smartID = [ETSmartID smartIDFromString:[segments objectAtIndex:1]];
        [AmpzNotificationCentral navigationNotification:smartID];
    }
}

-(void)awakeFromNib {
    //
    // register defaults
    //
    NSURL *defaultsURL = [[NSBundle mainBundle] URLForResource:@"Defaults" withExtension:@"plist"];
    NSDictionary *defaults = [NSDictionary dictionaryWithContentsOfURL:defaultsURL];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
    
    //
    // set api key
    //
    [ETAPIKeyManager setAPIKey:kAPI_KEY];
    
    //
    // handle global user login state
    //
    [ETSession subscribe:self];
    NSString *userToken = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsIdentifierToken];
    if (userToken) {
        ETSession *session = [[ETSession alloc] initWithToken:userToken];
        [ETSession setActiveSession:session];
    }
}

-(void)sessionStateChange:(NSNotification *)aNotification {
    ETSession *session = aNotification.object;
    if (!session || session != [ETSession activeSession])
    {
        return;
    }
    
    if (session.state == ETSessionStateTokenValid) {
        //
        // store valid sessions
        //
        [[NSUserDefaults standardUserDefaults]
         setValue:session.token
         forKey:kUserDefaultsIdentifierToken];
    } else {
        //
        // dismiss invalid sessions
        //
        [[NSUserDefaults standardUserDefaults]
         removeObjectForKey:kUserDefaultsIdentifierToken];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark AppDelegate

-(BOOL)applicationShouldHandleReopen:(NSApplication *)sender
                   hasVisibleWindows:(BOOL)flag
{
    //
    // Show window again
    //
    NSWindow *window = [sender.windows objectAtIndex:0];
    [window setValue:[NSNumber numberWithBool:YES] forKey:@"isVisible"];
    return YES;
}

-(void)applicationDidBecomeActive:(NSNotification *)notification {
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
}

-(void)dealloc {
    [ETSession unsubscribe:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

@end
