//
//  HomeController.h
//  Ampz
//
//  Created by Maximilian Täschner on 02/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PageItem.h"

@protocol MixListControllerDelegate <NSObject>
-(void)mixListControllerShowMix:(id)mixListItemButton;
@end

@interface MixListController : NSViewController <NSTableViewDataSource, NSTableViewDelegate, PageItemController>
@property (weak) IBOutlet NSTableView *mixTable;
@property (weak) IBOutlet NSScrollView *scrollView;
@end