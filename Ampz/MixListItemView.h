//
//  MixListItemView.h
//  Ampz
//
//  Created by Maximilian Täschner on 04/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MixPlayButton.h"
#import "TextualNavigationButton.h"

@class ETMix;

@interface MixListItemView : NSView

@property (weak) IBOutlet TextualNavigationButton *nameButton;
@property (weak) IBOutlet TextualNavigationButton *authorButton;
@property (weak) IBOutlet MixPlayButton *playButton;

@property (nonatomic, weak, readwrite) ETMix *representedObject;

@end
