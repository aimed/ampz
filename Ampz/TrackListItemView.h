//
//  TrackListItemView.h
//  Ampz
//
//  Created by Maximilian Täschner on 17/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LikeTrackButton.h"

@class ETTrack;
@interface TrackListItemView : NSView
@property (nonatomic, weak) ETTrack *track;
@property (nonatomic, weak) IBOutlet NSTextField *trackNo;
@property (nonatomic, weak) IBOutlet NSTextField *trackTitle;
@property (nonatomic, weak) IBOutlet NSTextField *trackArtist;
@property (nonatomic, weak) IBOutlet LikeTrackButton *likeButton;
@end
