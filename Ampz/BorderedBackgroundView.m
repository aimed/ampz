//
//  WhiteBackgroundView.m
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "BorderedBackgroundView.h"
@implementation BorderedBackgroundView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSColor *backgroundColor = _backgroundColor ?: NSColor.whiteColor;
    [backgroundColor setFill];
    NSRectFill(dirtyRect);
    
    NSColor *borderColor = _borderColor ?: [NSColor colorWithCalibratedWhite:0.0f alpha:0.1f];
    [borderColor setStroke];
    if (_borderBottom) {
        [NSBezierPath
         strokeLineFromPoint:NSMakePoint(NSMinX(dirtyRect),NSMinY(dirtyRect))
         toPoint:NSMakePoint(NSMaxX(dirtyRect), NSMinY(dirtyRect))];
    }
    
    if (_borderRight) {
        [NSBezierPath
         strokeLineFromPoint:NSMakePoint(NSMaxX(dirtyRect),NSMinY(dirtyRect))
         toPoint:NSMakePoint(NSMaxX(dirtyRect), NSMaxY(dirtyRect))];
    }
    
    if (_borderTop) {
        [NSBezierPath
         strokeLineFromPoint:NSMakePoint(NSMinX(dirtyRect),NSMaxY(dirtyRect))
         toPoint:NSMakePoint(NSMaxX(dirtyRect), NSMaxY(dirtyRect))];
    }
    
    if (_borderRight) {
        [NSBezierPath
         strokeLineFromPoint:NSMakePoint(NSMinX(dirtyRect),NSMinY(dirtyRect))
         toPoint:NSMakePoint(NSMinX(dirtyRect), NSMaxY(dirtyRect))];
    }
}
@end