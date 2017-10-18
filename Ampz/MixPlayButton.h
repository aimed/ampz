//
//  MixPlayButton.h
//  Ampz
//
//  Created by Maximilian Täschner on 06/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ETMix.h"
#import "PlayerController.h"

@interface MixPlayButton : NSButton
@property (nonatomic, strong) IBOutlet ETMix *mix;
@end
