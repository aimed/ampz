//
//  TrackListItemView.m
//  Ampz
//
//  Created by Maximilian Täschner on 17/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "TrackListItemView.h"
#import "ETTrack.h"

@implementation TrackListItemView

-(void)setTrack:(ETTrack *)track {
    _track = track;
    [_trackTitle setStringValue:track.name];
    [_trackArtist setStringValue:track.performer];
    [_likeButton setRepresentedObject:track];
}

@end
