//
//  UserPaneController.m
//  Ampz
//
//  Created by Maximilian Täschner on 10/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "UserPaneController.h"
#import "SessionObserver.h"
#import "ETUser.h"
#import "AmpzNotificationCentral.h"

typedef enum : NSUInteger {
    UserPaneControllerStateConnecting,
    UserPaneControllerStateConnected,
    UserPaneControllerStateDisconnected,
} UserPaneControllerState;

NSString *const kUserDefaultsKeyUser = @"CURRENT_USER";

@interface UserPaneController () <SessionObserverDelegate>
-(void)setUserImageForURL:(NSURL *)url;
-(void)updateState:(UserPaneControllerState)state user:(ETUser *)user;
@end

@implementation UserPaneController {
    ETUser *_currentUser;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SessionObserver subscribe:self];
}

-(void)dealloc
{
    [SessionObserver unsubscribe:self];
}

-(void)awakeFromNib
{
    NSData *userData = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsKeyUser];
    if (userData)
    {
        ETUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:userData];
        // fixes a bug with unreadable data
        if (user.id == nil)
        {
            user = nil;
        }
        [self updateState:UserPaneControllerStateConnecting user:user];
    }
    else
    {
        [self updateState:UserPaneControllerStateDisconnected user:nil];
    }
}

-(void)updateState:(UserPaneControllerState)state user:(ETUser *)user
{
    if (state != UserPaneControllerStateDisconnected && user != nil)
    {
        [_userNameButton setTitle:user.login];
        [_userNameButton setRepresentedObject:user];
        [self setUserImageForURL:user.avatar.sq56];
    }
    else if (state != UserPaneControllerStateDisconnected && user == nil)
    {
        [_userNameButton setTitle:@"Connecting..."];
        [_userNameButton setRepresentedObject:AmpzNavigationTargetSettings];
        [_userImage setImage:[NSImage imageNamed:NSImageNameUser]];
    }
    else if (state == UserPaneControllerStateDisconnected)
    {
        [_userNameButton setTitle:@"Sign in"];
        [_userNameButton setRepresentedObject:AmpzNavigationTargetSettings];
        [_userImage setImage:[NSImage imageNamed:NSImageNameUser]];
    }
    
    if (state == UserPaneControllerStateConnecting)
    {
        [self.view setAlphaValue:0.5];
    }
    else
    {
        [self.view setAlphaValue:1];
    }
}



#pragma mark SessionObserver

-(void)sessionInitialized:(ETSession *)session
{
    [self updateState:UserPaneControllerStateConnecting user:session.user];
}

-(void)sessionValidated:(ETSession *)session
{
    [self updateState:UserPaneControllerStateConnected user:session.user];
    NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:session.user];
    [[NSUserDefaults standardUserDefaults] setObject:userData forKey:kUserDefaultsKeyUser];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)sessionInvalidated:(ETSession *)session
{
    [self updateState:UserPaneControllerStateDisconnected user:nil];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kUserDefaultsKeyUser];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)setUserImageForURL:(NSURL *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if (connectionError || !data) {
             NSLog(@"Failed to load image");
             return;
         }
         NSImage *image = [[NSImage alloc] initWithData:data];
         [_userImage setImage:image];
     }];
}



#pragma mark UI

-(void)showSettingsPane:(id)sender
{
    [AmpzNotificationCentral navigationNotification:AmpzNavigationTargetSettings];
}


@end
