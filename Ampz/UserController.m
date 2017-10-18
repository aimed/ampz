//
//  UserController.m
//  Ampz
//
//  Created by Maximilian Täschner on 18/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "UserController.h"
#import "ETUser.h"
#import "ETSession.h"

@interface UserController ()

@end

@implementation UserController

-(void)awakeFromNib {
    [_profileImage setWantsLayer: YES];  // edit: enable the layer for the view.  Thanks omz
    _profileImage.layer.cornerRadius = _profileImage.frame.size.width/2;
    _profileImage.layer.masksToBounds = YES;
}

-(void)representPageItemEmpty:(PageItem *)pageItem {
    [self setRepresentedObject:pageItem.representedObject];
}

-(void)representPageItemWithData:(PageItem *)pageItem {
    [self representPageItemEmpty:pageItem];
}

-(void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    [self willChangeValueForKey:@"user"];
    _user = representedObject;
    [self didChangeValueForKey:@"user"];
    [_followUserButton setRepresentedObject:_user];
    
    [_user updateProperties:[ETUser includesToString:ETUserIncludesPublic]
                    session:[ETSession activeSession]
                   complete:^(NSError *err, id result)
    {
        [_followUserButton setRepresentedObject:_user];
    }];
}

@end
