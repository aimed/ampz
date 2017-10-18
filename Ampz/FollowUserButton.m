//
//  FollowUserButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 20/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "FollowUserButton.h"
#import "ETUser.h"
#import "ETRequest.h"
#import "ETSession.h"

@implementation FollowUserButton

-(BOOL)isEnabled {
    return [super isEnabled] && ![[ETSession activeSession].user isEqualTo:self.representedObject];
}

-(void)setRepresentedObject:(ETUser *)representedObject
{
    [super setRepresentedObject:representedObject];
    self.liked = representedObject.followedBySessionUser;
}

-(void)onClick:(id)sender
{
    BOOL following = self.liked;
    self.liked = !following;
    ETUser *user = self.representedObject;
    NSString *action   = following ? @"unfollow" : @"follow";
    NSString *endpoint = [NSString stringWithFormat:@"/users/%@/%@", user.id.stringValue, action];
    ETURL *url = [ETURL URLWithEndpoint:endpoint];
    ETRequest *request;
    request = [[ETRequest alloc] initWithURL:url
                                  andSession:[ETSession activeSession]
                                    complete:^(NSError *err, id result)
    {
        if (err)
        {
            NSLog(@"Error following/unfollowing user %@", err);
            self.liked = following;
        }
    }];
    [request send];
}

-(void)drawRect:(NSRect)dirtyRect {
    if ([self isEnabled]) {
        [super drawRect:dirtyRect];
    }
}

@end
