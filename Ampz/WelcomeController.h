//
//  WelcomeController.h
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MixPlayButton.h"

extern NSString *const kUserDefaultsKeyLastMix;

@interface WelcomeController : NSViewController
@property (nonatomic, weak) IBOutlet MixPlayButton *mixPlayButton;
@end
