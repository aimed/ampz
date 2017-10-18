//
//  NavigationButton.h
//  Ampz
//
//  Created by Maximilian Täschner on 16/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TextualNavigationButton : NSButton
@property (nonatomic, strong) IBInspectable NSColor *textColor;
@property (nonatomic, weak) IBOutlet id representedObject;
-(IBAction)onClick:(id)sender;
@end
