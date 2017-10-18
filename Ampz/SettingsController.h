//
//  SettingsController.h
//  Ampz
//
//  Created by Maximilian Täschner on 08/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PageItem.h"

@interface SettingsController : NSViewController <PageItemController>
@property (weak) IBOutlet NSTextField *usernameField;
@property (weak) IBOutlet NSSecureTextField *passwordField;
@property (weak) IBOutlet NSButton *loginButton;
-(IBAction)changeLoginState:(id)sender;
@end
