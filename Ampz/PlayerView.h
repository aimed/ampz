//
//  PlayerView.h
//  Ampz
//
//  Created by Maximilian Täschner on 06/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PlayPauseButton.h"
#import "SkipButton.h"
#import "ProgressSlider.h"
#import "LikeMixButton.h"
#import "VolumeButton.h"
#import "VolumeSliderCell.h"

@interface PlayerView : NSView
@property (nonatomic, weak) IBOutlet LikeMixButton *heartButton;
@property (nonatomic, weak) IBOutlet VolumeButton *volumeButton;
@property (nonatomic, weak) IBOutlet PlayPauseButton *playPauseButton;
@property (nonatomic, weak) IBOutlet ProgressSlider *progressSlider;
@property (nonatomic, weak) IBOutlet NSSlider *volumeSlider;
@property (nonatomic, weak) IBOutlet SkipButton *skipButton;
@property (nonatomic, weak) IBOutlet NSTextField *trackLabel;
@property (nonatomic, weak) IBOutlet NSTextField *artistLabel;
@property (nonatomic, weak) IBOutlet NSView *controlsContainer;

-(void)setBackgroundImageWithURL:(NSURL *)url;
-(void)setRepresentedSet:(ETSet *)set;
@end
