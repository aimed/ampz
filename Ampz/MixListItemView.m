//
//  MixListItemView.m
//  Ampz
//
//  Created by Maximilian Täschner on 04/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "MixListItemView.h"
#import "ETMix.h"
#import "ETUser.h"

@implementation MixListItemView

-(BOOL)translatesAutoresizingMaskIntoConstraints {
    return NO;
}

-(void)setRepresentedObject:(ETMix *)mix {
    _representedObject = mix;
    [_authorButton setTitle:mix.user.login];
    [_authorButton setRepresentedObject:mix.user];
    [_nameButton setTitle:mix.name];
    [_nameButton setRepresentedObject:mix];
    [_playButton setMix:mix];
}

@end
