//
//  SidePaneController.h
//  Ampz
//
//  Created by Maximilian Täschner on 11/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

extern NSString *const kSidePaneShouldClearSelected;

@interface SidePaneController : NSViewController <NSOutlineViewDataSource,NSOutlineViewDelegate>
@property (nonatomic, strong) IBOutlet NSOutlineView *sidePaneView;
@property (nonatomic, strong) IBOutlet NSSearchField *searchField;
-(IBAction)search:(id)sender;
@end
