//
//  MixDetailsController.h
//  Ampz
//
//  Created by Maximilian Täschner on 15/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PageItem.h"
#import "ETMix.h"
#import "LikeMixButton.h"
#import "MixPlayButton.h"
#import "TrackListController.h"
#import "TextualNavigationButton.h"


@interface MixDetailsController : NSViewController <PageItemController>
@property (weak) IBOutlet LikeMixButton *likeMixButton;
@property (weak) IBOutlet MixPlayButton *mixPlayButton;
@property (weak) IBOutlet TextualNavigationButton *authorButton;
@property (nonatomic, strong) IBOutlet ETMix *mix;
@property (nonatomic, strong) IBOutlet TrackListController *trackListController;

@end