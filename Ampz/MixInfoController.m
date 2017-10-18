//
//  MixPlayerController.m
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "MixInfoController.h"
#import "AmpzNotificationCentral.h"
#import "PlayerController.h"
#import "BorderedBackgroundView.h"
#import "ETMix.h"
#import "ETSession.h"
#import "ErrorController.h"

@interface MixInfoController ()
-(void)onMixSet:(NSNotification *)aNotification;
@end

@implementation MixInfoController {
    NSView *emptyStateView;
    ETMix *_mix;
    ErrorController *errorController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //
    // empty state view
    //
    NSRect frame = self.view.bounds;
    frame.origin.y += 1;
    frame.size.height -= 1;
    emptyStateView = [BorderedBackgroundView new];
    emptyStateView.frame = frame;
    emptyStateView.autoresizingMask = NSViewHeightSizable | NSViewWidthSizable;
    [self.view addSubview:emptyStateView];
    
    //
    // show errors
    //
    errorController = [ErrorController new];
    NSView *errorView = errorController.view;
    [self.view addSubview:errorView];
    errorView.frame = self.view.bounds;
    errorView.autoresizingMask = NSViewHeightSizable | NSViewWidthSizable;
    
    //
    // Listen for mix changes
    //
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(onMixSet:)
     name:PlaybackStateNotificationSetMix
     object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:PlaybackStateNotificationSetMix
     object:nil];
}

-(void)onMixSet:(NSNotification *)aNotification {
    ETMix *mix = aNotification.object;
    _mix = mix;
    
    if (mix == nil) {
        return;
    }
    
    if (emptyStateView) {
        [emptyStateView removeFromSuperview];
        emptyStateView = nil;
    }
    
    [_mixImageButton setImage:[[NSImage alloc] initByReferencingURL:mix.cover.sq56]];
    [_mixTitleField setStringValue:mix.name];
    [_heartButton setRepresentedObject:mix];
}

-(void)showMix:(id)sender {
    [AmpzNotificationCentral navigationNotification:_mix];
}

@end
