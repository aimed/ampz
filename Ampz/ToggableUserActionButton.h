//
//  LikeButton.h
//  Ampz
//
//  Created by Maximilian Täschner on 14/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "UserActionButton.h"

@interface ToggableUserActionButton : UserActionButton
@property (nonatomic, strong) IBInspectable NSColor *onStateColor;
@property (nonatomic, strong) IBInspectable NSColor *offStateColor;
@property (nonatomic, strong) IBInspectable NSColor *disabledStateColor;
@property (nonatomic, assign) BOOL liked;
@property (nonatomic, weak) IBOutlet id representedObject;
-(IBAction)onClick:(id)sender;
-(NSColor *)color;
@end