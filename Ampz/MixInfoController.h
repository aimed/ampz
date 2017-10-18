//
//  MixPlayerController.h
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LikeMixButton.h"

@interface MixInfoController : NSViewController
@property (weak) IBOutlet NSButton *mixImageButton;
@property (weak) IBOutlet NSTextField *mixTitleField;
@property (weak) IBOutlet LikeMixButton *heartButton;
-(IBAction)showMix:(id)sender;
@end
