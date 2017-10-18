//
//  UserController.h
//  Ampz
//
//  Created by Maximilian Täschner on 18/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PageItem.h"
#import "FollowUserButton.h"

@class ETUser;
@interface UserController : NSViewController <PageItemController>
@property (nonatomic, strong) IBOutlet ETUser *user;
@property (weak) IBOutlet FollowUserButton *followUserButton;
@property (weak) IBOutlet NSImageView *profileImage;

@end