//
//  WhiteBackgroundView.h
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface  BorderedBackgroundView : NSView
@property (assign) IBInspectable BOOL borderBottom;
@property (assign) IBInspectable BOOL borderRight;
@property (assign) IBInspectable BOOL borderTop;
@property (assign) IBInspectable BOOL borderLeft;
@property (strong) IBInspectable NSColor *backgroundColor;
@property (strong) IBInspectable NSColor *borderColor;
@end
