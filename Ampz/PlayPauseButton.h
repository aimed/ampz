//
//  PlayPauseButton.h
//  Ampz
//
//  Created by Maximilian Täschner on 06/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

IB_DESIGNABLE
@interface PlayPauseButton : NSButton
@property (nonatomic, assign) IBInspectable BOOL isPlaying;
@property (nonatomic, strong) IBInspectable NSColor *color;
@end
