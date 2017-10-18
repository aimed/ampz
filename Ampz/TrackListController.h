//
//  TrackListController.h
//  Ampz
//
//  Created by Maximilian Täschner on 17/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TrackListController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>
@property (nonatomic, weak) NSArray *tracks;
@end
