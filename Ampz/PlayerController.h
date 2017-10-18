//
//  PlayerController.h
//  Ampz
//
//  Created by Maximilian Täschner on 02/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <STKAudioPlayer.h>

#import "PlayerView.h"
#import "LikeTrackButton.h"

@class ETSet;

extern NSString *const PlaybackStateNotificationSetMix;
extern NSString *const PlaybackStateNotificationSetPlay;
extern NSString *const PlaybackStateNotificationStateChanged;
extern NSString *const kUserDefaultsIdentifierVolume;

@interface PlayerController : NSViewController <STKAudioPlayerDelegate>

@property (strong) IBOutlet PlayerView *playerView;
@property (weak) IBOutlet PlayPauseButton *playPauseButton;
@property (weak) IBOutlet SkipButton *skipTrackButton;
@property (weak) IBOutlet ProgressSlider *progressSlider;
@property (weak) IBOutlet NSTextField *trackLabel;
@property (weak) IBOutlet NSTextField *artistLabel;
@property (weak) IBOutlet LikeTrackButton *starButton;
@property (nonatomic, strong) ETSet *set;

-(IBAction)togglePlay:(id)sender;
-(IBAction)skipTrack:(id)sender;
-(IBAction)setVolume:(id)sender;

+(ETMix *)currentMix;
+(ETSet *)currentSet;
@end
