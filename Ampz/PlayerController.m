//
//  PlayerController.m
//  Ampz
//
//  Created by Maximilian Täschner on 02/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//
#import "PlayerController.h"
#import <IOKit/pwr_mgt/IOPMLib.h>
#import "WelcomeController.h"
#import "ETSet.h"
#import "ETMix.h"
#import "ETTrack.h"
#import "ETSession.h"
#import "ErrorController.h"
#import "Notifications.h"

NSString *const PlaybackStateNotificationSetMix = @"PlaybackStateNotificationSetMix";
NSString *const PlaybackStateNotificationSetPlay = @"PlaybackStateNotificationSetPlay";
NSString *const PlaybackStateNotificationStateChanged = @"ASStatusChangedNotification";
NSString *const kUserDefaultsIdentifierSet = @"ACTIVE_SET";
NSString *const kUserDefaultsVolume = @"volume";

static ETMix *_mix;
static ETSet *_currentSet;

@interface PlayerController () <ETSessionStateChangeListener>
@property (nonatomic, strong) ETMix *queuedMix;
@property (nonatomic, strong) STKAudioPlayer *player;
@property (nonatomic, strong) NSTimer *timer;
-(void)isReady;
-(void)addObservers;
-(void)prepareInitialSet;
-(void)showEmptyStateView;
-(void)setMix:(NSNotification*)aNotification;
-(void)playCurrentTrack;
-(void)nextTrack;
-(void)nextMix;
-(void)updateMixView;
@end



@implementation PlayerController {
    WelcomeController *welcomeController;
    CFStringRef _reasonForActivity;
    IOPMAssertionID _assertionID;
    IOReturn _sleepSuccess;
    BOOL _shouldPlay;
}

#pragma mark Setup

-(void)awakeFromNib {
    _player = [[STKAudioPlayer alloc] init];
    _player.delegate = self;
    
    [_player setVolume:[PlayerController defaultVolume]];
    _shouldPlay = NO;
    _reasonForActivity = CFSTR("Playing Music Ampz");
    [_playPauseButton setIsPlaying:NO];
    [_progressSlider setDoubleValue:0];
    [_playerView.volumeSlider setFloatValue:[PlayerController defaultVolume]];
}

-(void)viewDidLoad {
    [self addObservers];
    [self prepareInitialSet];
    [self showEmptyStateView];
}

-(void)showEmptyStateView {
    welcomeController = [WelcomeController new];
    [self.view addSubview:welcomeController.view];
    welcomeController.view.frame = self.view.bounds;
    welcomeController.view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
}

-(void)addObservers {
    // observe setmix
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setMix:)
                                                 name:PlaybackStateNotificationSetMix
                                               object:nil];
    // observe setplay
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(togglePlay:)
                                                 name:PlaybackStateNotificationSetPlay
                                               object:nil];
    // observe user session
    [ETSession subscribe:self];
}

-(void)prepareInitialSet {
    NSString *token = [[NSUserDefaults standardUserDefaults]
                       objectForKey:kUserDefaultsIdentifierSet];
    
    //
    // there is a set token stored
    //
    if (token)
    {
        _set = [[ETSet alloc] initWithDict:@{@"play_token":token}];
        [self isReady];
        return;
    }
    
    //
    // get a new set token
    //
    [ETSet get:^(NSError *err, id result) {
        
        if (err)
        {
            NSLog(@"Error getting set: %@", err);
            [ErrorController showError:err];
            return ;
        }
        
        _set = (ETSet *)result;
        [[NSUserDefaults standardUserDefaults] setObject:_set.token
                                                  forKey:kUserDefaultsIdentifierSet];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self isReady];
    }];
}

-(void)isReady {
    //
    // get currentmix from nsuserdefaults
    // if !session -> set mixneedssessionupdate = YES;
    //
    if (_queuedMix) {
        [_set playMix:_queuedMix complete:^(NSError *err, id result) {
            if (!err) {
                [self playCurrentTrack];
            }
        }];
    }
    
    _currentSet = _set;
}

-(void)sessionStateChange:(NSNotification *)aNotification {
    ETSession *session = aNotification.object;
    
    if (session != [ETSession activeSession]) {
        return;
    }
    
    //
    // invalidate session
    //
    BOOL invalidateSession = !(session && session.isValid);
    if (invalidateSession) {
        [_set setSession:nil];
        return;
    }
    
    //
    // assign session to set
    //
    [_set setSession:session];
    
    //
    // user signed in after starting playback
    //
    BOOL signedInAfterStart = session.previousState < ETSessionStateTokenCreated && _set.currentMix;
    if (!signedInAfterStart)
    {
        return;
    }
    
    //
    // update mix info
    //
    [_set.currentMix updateProperties:@"user,liked"
                              session:[ETSession activeSession]
                             complete:^(NSError *err, id result)
     {
         if (!err) {
             [self updateMixView];
         }
     }];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_player dispose];
}



#pragma mark - Player Delegate

-(void)audioPlayer:(STKAudioPlayer *)audioPlayer didStartPlayingQueueItemId:(NSObject *)queueItemId {}
-(void)audioPlayer:(STKAudioPlayer *)audioPlayer didCancelQueuedItems:(NSArray *)queuedItems {}
-(void)audioPlayer:(STKAudioPlayer *)audioPlayer didFinishBufferingSourceWithQueueItemId:(NSObject *)queueItemId {}
-(void)audioPlayer:(STKAudioPlayer *)audioPlayer unexpectedError:(STKAudioPlayerErrorCode)errorCode {}

-(void)audioPlayer:(STKAudioPlayer *)audioPlayer
didFinishPlayingQueueItemId:(NSObject *)queueItemId
        withReason:(STKAudioPlayerStopReason)stopReason
       andProgress:(double)progress
       andDuration:(double)duration
{
    switch (stopReason) {
        case STKAudioPlayerStopReasonEof:
            NSLog(@"stopreason eof");
            [self nextTrack];
            break;
        case STKAudioPlayerStopReasonError:
            NSLog(@"stopreason error");
            [self togglePlay:nil];
        default:
            NSLog(@"unhandled stopreason");
            break;
    }
}

-(void)audioPlayer:(STKAudioPlayer *)audioPlayer
      stateChanged:(STKAudioPlayerState)state
     previousState:(STKAudioPlayerState)previousState
{
    NSLog(@"newstate: %u; prev: %u", state, previousState);
    
    if (state == STKAudioPlayerStateStopped) {
        NSLog(@"STKAudioPlayerStateStopped...");
        [self nextTrack];
    }
}

#pragma mark - Playback

-(void)playCurrentTrack {
    if (_set.currentTrack && _player) {
        ETTrack *track = _set.currentTrack;
        [self setShouldPlay:YES];
        [_playPauseButton setIsPlaying:YES];
        
        // start playback
        [_player playURL:track.trackFileStreamURL];
        
        // TODO key value binding?
        [_artistLabel setStringValue:_set.currentTrack.performer];
        [_trackLabel setStringValue:_set.currentTrack.name];
        [_playerView.skipButton setEnabled:_set.skipAllowed];
        [_starButton setRepresentedObject:_set.currentTrack];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationPlaybackTrackDidChange object:nil];
    }
}

-(void)skipTrack:(id)sender {
    [_set skipTrack:^(NSError *err, id result) {
        if (err) {
            NSLog(@"Error playing next track: %@", err);
            [ErrorController showError:err];
            return;
        }
        
        //
        // play next track
        //
        if (!_set.atEnd)
        {
            [self playCurrentTrack];
            return;
        }
        
        //
        // at end -> load next mix
        //
        [self nextMix];
        
    }];
}

-(void)nextTrack {
    [_set nextTrack:^(NSError *err, id result) {
        if (err) {
            NSLog(@"Error playing next track: %@", err);
            [ErrorController showError:err];
            return;
        }
        
        //
        // play next track
        //
        if (!_set.atEnd)
        {
            [self playCurrentTrack];
            return;
        }
        
        //
        // at end -> load next mix
        //
        [self nextMix];

    }];
}

-(void)nextMix {
    [_set playNextMixInSet:^(NSError *err, id result) {
        if (err) {
            NSLog(@"Error playing next track (new mix): %@", err);
            [ErrorController showError:err];
            return;
        }
        
        [self playCurrentTrack];
        [self updateMixView];
        
        // promote mix change
        [[NSNotificationCenter defaultCenter]
         postNotificationName:PlaybackStateNotificationSetMix
         object:_set.currentMix];
    }];
}

-(void)setMix:(NSNotification *)aNotification {
    //
    // set current mix (this is not really neat..)
    //
    _mix = aNotification.object;
    
    if (!_mix) {
        return;
    }
    
    //
    // remove welcome view
    //
    if (welcomeController != nil && [self.view.subviews containsObject:_playerView])
    {
        [welcomeController.view removeFromSuperview];
    }
    
    //
    // store last mix
    //
    NSData *mixData = [NSKeyedArchiver archivedDataWithRootObject:_mix];
    [[NSUserDefaults standardUserDefaults] setObject:mixData forKey:kUserDefaultsKeyLastMix];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (_set == nil)
    {
        //
        // queue mix if not ready
        //
        _queuedMix = _mix;
        return;
    }
    
    //
    // Play Mix / Toggle play
    //
    if (![_set.currentMix isEqualTo:_mix])
    {
        [_set playMix:_mix complete:^(NSError *err, id result) {
            if (err) {
                NSLog(@"Error settings mix %@", err);
                [ErrorController showError:err];
                return ;
            }
            
            // TODO still show new mix in case an error occured, but show error
            [self playCurrentTrack];
            [self updateMixView];
        }];
    }
    else
    {
        //
        // toggle play
        //
        [self togglePlay:nil];
    }
}

-(void)setShouldPlay:(BOOL)yesOrNo {
    if (yesOrNo) {
        _sleepSuccess = IOPMAssertionCreateWithName(
                                              kIOPMAssertionTypeNoIdleSleep,
                                              kIOPMAssertionLevelOn,
                                              _reasonForActivity,
                                              &_assertionID);
        [self createTimer];
    } else {
        _sleepSuccess = IOPMAssertionRelease(_assertionID);
        [self destroyTimer];
    }
    _shouldPlay = yesOrNo;
}

-(void)togglePlay:(id)sender {
    
    if (!(_set && [_set hasTrack] && _player)) {
        [self setShouldPlay:NO];
        return;
    }
    
    [self setShouldPlay:!_shouldPlay];
    
    //
    // toggle play
    //
    if (!_playPauseButton.isPlaying)
    {
        [_player resume];
        _playPauseButton.isPlaying = YES;
    }
    else
    {
        [_player pause];
        _playPauseButton.isPlaying = NO;
    }
}


#pragma mark Timer

-(void)createTimer {
    if (_timer) {
        return;
    }
    _timer = [NSTimer
              scheduledTimerWithTimeInterval:0.7
              target:self selector:@selector(onTimer:)
              userInfo:nil
              repeats:YES];
}

-(void)destroyTimer {
    if (!_timer) {
        return;
    }
    [_timer invalidate];
    _timer = nil;
}

-(void)onTimer:(NSNotification *)aNotification
{
    double duration = _player.duration;
    double progress = duration > 0 ? 100 * _player.progress / duration : 0;
    _playerView.progressSlider.doubleValue = progress;
}


#pragma mark - UI

-(void)setVolume:(NSSlider *) sender {
    float volume = sender.floatValue;
    if (_player)
    {
        [_player setVolume:volume];
    }
    [PlayerController setDefaultVolume:volume];
}

-(void)updateMixView {
    ETMix *mix = _set.currentMix;
    [_playerView setBackgroundImageWithURL:mix.cover.sq500];
}

#pragma mark - Static

+(ETMix *)currentMix {
    return _mix;
}

+(ETSet *)currentSet {
    return _currentSet;
}

#pragma mark Volume

+(float)defaultVolume {
    NSNumber *volume;
    volume = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsVolume];
    return volume == nil ? 1.0f : [volume floatValue];
}

+(void)setDefaultVolume:(float)volume {
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithFloat:volume]
                                              forKey:kUserDefaultsVolume];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
