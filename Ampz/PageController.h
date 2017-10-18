//
//  PageController.h
//  Ampz
//
//  Created by Maximilian Täschner on 05/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PageControllerView.h"
#import "PageItem.h"

@interface PageController : NSViewController <SwipeGestureRecognizerDelegate>
@property (weak) IBOutlet NSView *contentView;
@end
