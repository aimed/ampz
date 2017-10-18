//
//  InfoButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 15/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "InfoButton.h"

@implementation InfoButton
-(void)awakeFromNib {
    [super awakeFromNib];
    [self setTitle:@""];
    [self setBordered:NO];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
    [self drawInfoWithFrame:dirtyRect];
}

- (void)drawInfoWithFrame: (NSRect)frame
{
    //// Color Declarations
    NSColor* color0 = _color ? _color : [NSColor colorWithCalibratedRed: 0.205 green: 0.205 blue: 0.205 alpha: 1];
    
    //// Bezier 2 Drawing
    NSBezierPath* bezier2Path = NSBezierPath.bezierPath;
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.44416 * NSWidth(frame), NSMinY(frame) + 0.32632 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.48478 * NSWidth(frame), NSMinY(frame) + 0.28530 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.44416 * NSWidth(frame), NSMinY(frame) + 0.30376 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.46244 * NSWidth(frame), NSMinY(frame) + 0.28530 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.51187 * NSWidth(frame), NSMinY(frame) + 0.28530 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.55249 * NSWidth(frame), NSMinY(frame) + 0.32632 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.53421 * NSWidth(frame), NSMinY(frame) + 0.28530 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.55249 * NSWidth(frame), NSMinY(frame) + 0.30376 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.55249 * NSWidth(frame), NSMinY(frame) + 0.35366 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.51187 * NSWidth(frame), NSMinY(frame) + 0.39468 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.55249 * NSWidth(frame), NSMinY(frame) + 0.37622 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.53421 * NSWidth(frame), NSMinY(frame) + 0.39468 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.48478 * NSWidth(frame), NSMinY(frame) + 0.39468 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.44416 * NSWidth(frame), NSMinY(frame) + 0.35366 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.46244 * NSWidth(frame), NSMinY(frame) + 0.39468 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.44416 * NSWidth(frame), NSMinY(frame) + 0.37622 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.44416 * NSWidth(frame), NSMinY(frame) + 0.32632 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path setMiterLimit: 4];
    [color0 setFill];
    [bezier2Path fill];
    
    
    //// Bezier 4 Drawing
    NSBezierPath* bezier4Path = NSBezierPath.bezierPath;
    [bezier4Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.60666 * NSWidth(frame), NSMinY(frame) + 0.72280 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.38999 * NSWidth(frame), NSMinY(frame) + 0.72280 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.38999 * NSWidth(frame), NSMinY(frame) + 0.66812 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.44416 * NSWidth(frame), NSMinY(frame) + 0.66812 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.44416 * NSWidth(frame), NSMinY(frame) + 0.50405 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.38999 * NSWidth(frame), NSMinY(frame) + 0.50405 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.38999 * NSWidth(frame), NSMinY(frame) + 0.44937 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.55249 * NSWidth(frame), NSMinY(frame) + 0.44937 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.55249 * NSWidth(frame), NSMinY(frame) + 0.66812 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.60666 * NSWidth(frame), NSMinY(frame) + 0.66812 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.60666 * NSWidth(frame), NSMinY(frame) + 0.72280 * NSHeight(frame))];
    [bezier4Path closePath];
    [bezier4Path setMiterLimit: 4];
    [color0 setFill];
    [bezier4Path fill];
    
    
    //// Bezier 6 Drawing
    NSBezierPath* bezier6Path = NSBezierPath.bezierPath;
    [bezier6Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.49832 * NSWidth(frame), NSMinY(frame) + 0.06655 * NSHeight(frame))];
    [bezier6Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.06499 * NSWidth(frame), NSMinY(frame) + 0.50405 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.25899 * NSWidth(frame), NSMinY(frame) + 0.06655 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.06499 * NSWidth(frame), NSMinY(frame) + 0.26242 * NSHeight(frame))];
    [bezier6Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.49832 * NSWidth(frame), NSMinY(frame) + 0.94155 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.06499 * NSWidth(frame), NSMinY(frame) + 0.74569 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.25899 * NSWidth(frame), NSMinY(frame) + 0.94155 * NSHeight(frame))];
    [bezier6Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.93166 * NSWidth(frame), NSMinY(frame) + 0.50405 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.73766 * NSWidth(frame), NSMinY(frame) + 0.94155 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.93166 * NSWidth(frame), NSMinY(frame) + 0.74569 * NSHeight(frame))];
    [bezier6Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.49832 * NSWidth(frame), NSMinY(frame) + 0.06655 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.93166 * NSWidth(frame), NSMinY(frame) + 0.26242 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.73766 * NSWidth(frame), NSMinY(frame) + 0.06655 * NSHeight(frame))];
    [bezier6Path closePath];
    [bezier6Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.49832 * NSWidth(frame), NSMinY(frame) + 0.85952 * NSHeight(frame))];
    [bezier6Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.14624 * NSWidth(frame), NSMinY(frame) + 0.50405 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.30387 * NSWidth(frame), NSMinY(frame) + 0.85952 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.14624 * NSWidth(frame), NSMinY(frame) + 0.70038 * NSHeight(frame))];
    [bezier6Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.49832 * NSWidth(frame), NSMinY(frame) + 0.14858 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.14624 * NSWidth(frame), NSMinY(frame) + 0.30772 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.30387 * NSWidth(frame), NSMinY(frame) + 0.14858 * NSHeight(frame))];
    [bezier6Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.85041 * NSWidth(frame), NSMinY(frame) + 0.50405 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.69278 * NSWidth(frame), NSMinY(frame) + 0.14858 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.85041 * NSWidth(frame), NSMinY(frame) + 0.30772 * NSHeight(frame))];
    [bezier6Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.49832 * NSWidth(frame), NSMinY(frame) + 0.85952 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.85041 * NSWidth(frame), NSMinY(frame) + 0.70038 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.69278 * NSWidth(frame), NSMinY(frame) + 0.85952 * NSHeight(frame))];
    [bezier6Path closePath];
    [bezier6Path setMiterLimit: 4];
    [color0 setFill];
    [bezier6Path fill];
}

@end
