//
//  UserPaneController.h
//  Ampz
//
//  Created by Maximilian Täschner on 10/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TextualNavigationButton.h"
@interface UserPaneController : NSViewController
@property (weak) IBOutlet TextualNavigationButton *userNameButton;
@property (weak) IBOutlet NSImageView *userImage;
-(IBAction)showSettingsPane:(id)sender;
@end
