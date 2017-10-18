//
//  TrackListButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "TrackListButton.h"

@implementation TrackListButton

-(void)awakeFromNib {
    [self setTitle:@""];
    [self setBordered:NO];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawStackWithFrame:dirtyRect];
}

- (void)drawStackWithFrame: (NSRect)frame
{
    //// Color Declarations
    NSColor* color0 = _color ? _color : [NSColor colorWithCalibratedRed: 0.205 green: 0.205 blue: 0.205 alpha: 1];
    //// Bezier 2 Drawing
    NSBezierPath* bezier2Path = NSBezierPath.bezierPath;
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.89167 * NSWidth(frame), NSMinY(frame) + 0.35280 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.15726 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.11061 * NSWidth(frame), NSMinY(frame) + 0.35280 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.54835 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.89167 * NSWidth(frame), NSMinY(frame) + 0.35280 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.22216 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.76204 * NSWidth(frame), NSMinY(frame) + 0.35280 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.48345 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.24024 * NSWidth(frame), NSMinY(frame) + 0.35280 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.22216 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.81344 * NSWidth(frame), NSMinY(frame) + 0.46031 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.89167 * NSWidth(frame), NSMinY(frame) + 0.49946 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.69501 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.11061 * NSWidth(frame), NSMinY(frame) + 0.49946 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.18884 * NSWidth(frame), NSMinY(frame) + 0.46031 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.61669 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.81344 * NSWidth(frame), NSMinY(frame) + 0.46031 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.81344 * NSWidth(frame), NSMinY(frame) + 0.60696 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.89167 * NSWidth(frame), NSMinY(frame) + 0.64612 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.84167 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.11061 * NSWidth(frame), NSMinY(frame) + 0.64612 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.18884 * NSWidth(frame), NSMinY(frame) + 0.60696 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.50114 * NSWidth(frame), NSMinY(frame) + 0.76335 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.81344 * NSWidth(frame), NSMinY(frame) + 0.60696 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path setMiterLimit: 4];
    [color0 setFill];
    [bezier2Path fill];
}

@end
