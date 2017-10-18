//
//  MixDetailsController.m
//  Ampz
//
//  Created by Maximilian Täschner on 15/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "MixDetailsController.h"
#import "NSAttributedString+Hyperlink.h"
#import "BlurredImageLayer.h"
#import "ETUser.h"
#import "ETSession.h"
#import "PlayerController.h"
#import <Mantle.h>

@interface MixDetailsController ()
@end

@implementation MixDetailsController {
    BlurredImageLayer *_blurredImageLayer;
}

#pragma mark - Lifecycle

-(void)awakeFromNib {
}

-(void)representPageItemEmpty:(PageItem *)pageItem {
    if ([[PlayerController currentMix] isEqualTo:pageItem.representedObject])
    {
        pageItem.representedObject = [PlayerController currentMix];
    }
    
    [self willChangeValueForKey:@"mix"];
    _mix = pageItem.representedObject;
    [self didChangeValueForKey:@"mix"];
    
    [_mix updateProperties:@"user,liked,likes_count" session:[ETSession activeSession] complete:^(NSError *err, id result)
     {
         pageItem.data = _mix;
         [self updateBindings];
     }];
    
    [self updateBindings];
}

-(void)representPageItemWithData:(PageItem *)pageItem {
    [self willChangeValueForKey:@"mix"];
    _mix = pageItem.representedObject;
    [self didChangeValueForKey:@"mix"];
    
    [self updateBindings];
}

-(void)updateBindings {
    [self didChangeValueForKey:@"mix"];
    [_likeMixButton setRepresentedObject:_mix];
    [_mixPlayButton setMix:_mix];
    [_authorButton setRepresentedObject:_mix.user];

    _trackListController.view.hidden = _mix.tracksPlayed == nil || _mix.tracksPlayed.count == 0;
    [_trackListController setTracks:_mix.tracksPlayed];
}


@end
