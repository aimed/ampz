//
//  VolumeButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 08/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "VolumeButton.h"

@implementation VolumeButton

-(void)awakeFromNib {
    [self setTitle:@""];
    [self setBordered:NO];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawVolumeMediumWithFrame:dirtyRect];
}

- (void)drawVolumeMediumWithFrame: (NSRect)frame
{
    //// Color Declarations
    NSColor* color0 = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    NSShadow* shadow = NSShadow.alloc.init;
    [shadow setShadowColor: [NSColor.blackColor colorWithAlphaComponent: 0.3]];
    [shadow setShadowOffset: NSMakeSize(0.1, -1.1)];
    [shadow setShadowBlurRadius: 1];
    
    //// Bezier 2 Drawing
    NSBezierPath* bezier2Path = NSBezierPath.bezierPath;
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.72814 * NSWidth(frame), NSMinY(frame) + 0.79957 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.69783 * NSWidth(frame), NSMinY(frame) + 0.78703 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.71717 * NSWidth(frame), NSMinY(frame) + 0.79957 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.70620 * NSWidth(frame), NSMinY(frame) + 0.79540 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.69783 * NSWidth(frame), NSMinY(frame) + 0.72643 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.68109 * NSWidth(frame), NSMinY(frame) + 0.77029 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.68109 * NSWidth(frame), NSMinY(frame) + 0.74317 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.69783 * NSWidth(frame), NSMinY(frame) + 0.30217 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.81480 * NSWidth(frame), NSMinY(frame) + 0.60946 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.81480 * NSWidth(frame), NSMinY(frame) + 0.41914 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.69783 * NSWidth(frame), NSMinY(frame) + 0.24157 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.68109 * NSWidth(frame), NSMinY(frame) + 0.28543 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.68109 * NSWidth(frame), NSMinY(frame) + 0.25829 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.75843 * NSWidth(frame), NSMinY(frame) + 0.24157 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.71457 * NSWidth(frame), NSMinY(frame) + 0.22486 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.74171 * NSWidth(frame), NSMinY(frame) + 0.22483 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.87140 * NSWidth(frame), NSMinY(frame) + 0.51431 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.83129 * NSWidth(frame), NSMinY(frame) + 0.31443 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.87140 * NSWidth(frame), NSMinY(frame) + 0.41129 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.75843 * NSWidth(frame), NSMinY(frame) + 0.78706 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.87140 * NSWidth(frame), NSMinY(frame) + 0.61734 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.83129 * NSWidth(frame), NSMinY(frame) + 0.71420 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.72811 * NSWidth(frame), NSMinY(frame) + 0.79960 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.75006 * NSWidth(frame), NSMinY(frame) + 0.79543 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.73909 * NSWidth(frame), NSMinY(frame) + 0.79960 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.72811 * NSWidth(frame), NSMinY(frame) + 0.79960 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.72814 * NSWidth(frame), NSMinY(frame) + 0.79957 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.57591 * NSWidth(frame), NSMinY(frame) + 0.71877 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.54560 * NSWidth(frame), NSMinY(frame) + 0.70623 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.56494 * NSWidth(frame), NSMinY(frame) + 0.71877 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.55397 * NSWidth(frame), NSMinY(frame) + 0.71460 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.54560 * NSWidth(frame), NSMinY(frame) + 0.64563 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.52886 * NSWidth(frame), NSMinY(frame) + 0.68949 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.52886 * NSWidth(frame), NSMinY(frame) + 0.66237 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.54560 * NSWidth(frame), NSMinY(frame) + 0.38300 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.61800 * NSWidth(frame), NSMinY(frame) + 0.57323 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.61800 * NSWidth(frame), NSMinY(frame) + 0.45540 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.54560 * NSWidth(frame), NSMinY(frame) + 0.32240 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.52886 * NSWidth(frame), NSMinY(frame) + 0.36626 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.52886 * NSWidth(frame), NSMinY(frame) + 0.33911 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.60620 * NSWidth(frame), NSMinY(frame) + 0.32240 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.56234 * NSWidth(frame), NSMinY(frame) + 0.30569 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.58946 * NSWidth(frame), NSMinY(frame) + 0.30566 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.60620 * NSWidth(frame), NSMinY(frame) + 0.70626 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.71203 * NSWidth(frame), NSMinY(frame) + 0.42823 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.71203 * NSWidth(frame), NSMinY(frame) + 0.60043 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.57589 * NSWidth(frame), NSMinY(frame) + 0.71880 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.59783 * NSWidth(frame), NSMinY(frame) + 0.71463 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.58686 * NSWidth(frame), NSMinY(frame) + 0.71880 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.57591 * NSWidth(frame), NSMinY(frame) + 0.71877 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path setMiterLimit: 4];
    [NSGraphicsContext saveGraphicsState];
    [shadow set];
    [color0 setFill];
    [bezier2Path fill];
    [NSGraphicsContext restoreGraphicsState];
    
    
    
    //// Bezier 4 Drawing
    NSBezierPath* bezier4Path = NSBezierPath.bezierPath;
    [bezier4Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.45714 * NSWidth(frame), NSMinY(frame) + 0.91429 * NSHeight(frame))];
    [bezier4Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.43694 * NSWidth(frame), NSMinY(frame) + 0.90591 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.44971 * NSWidth(frame), NSMinY(frame) + 0.91429 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.44240 * NSWidth(frame), NSMinY(frame) + 0.91137 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.21674 * NSWidth(frame), NSMinY(frame) + 0.68571 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.11429 * NSWidth(frame), NSMinY(frame) + 0.68571 * NSHeight(frame))];
    [bezier4Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.08571 * NSWidth(frame), NSMinY(frame) + 0.65714 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.09851 * NSWidth(frame), NSMinY(frame) + 0.68571 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.08571 * NSWidth(frame), NSMinY(frame) + 0.67291 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.08571 * NSWidth(frame), NSMinY(frame) + 0.37143 * NSHeight(frame))];
    [bezier4Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.11429 * NSWidth(frame), NSMinY(frame) + 0.34286 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.08571 * NSWidth(frame), NSMinY(frame) + 0.35566 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.09851 * NSWidth(frame), NSMinY(frame) + 0.34286 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.21674 * NSWidth(frame), NSMinY(frame) + 0.34286 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.43694 * NSWidth(frame), NSMinY(frame) + 0.12266 * NSHeight(frame))];
    [bezier4Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.46809 * NSWidth(frame), NSMinY(frame) + 0.11646 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.44511 * NSWidth(frame), NSMinY(frame) + 0.11449 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.45740 * NSWidth(frame), NSMinY(frame) + 0.11203 * NSHeight(frame))];
    [bezier4Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.48571 * NSWidth(frame), NSMinY(frame) + 0.14286 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.47877 * NSWidth(frame), NSMinY(frame) + 0.12089 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.48571 * NSWidth(frame), NSMinY(frame) + 0.13129 * NSHeight(frame))];
    [bezier4Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.48571 * NSWidth(frame), NSMinY(frame) + 0.88571 * NSHeight(frame))];
    [bezier4Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.46809 * NSWidth(frame), NSMinY(frame) + 0.91211 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.48571 * NSWidth(frame), NSMinY(frame) + 0.89726 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.47874 * NSWidth(frame), NSMinY(frame) + 0.90769 * NSHeight(frame))];
    [bezier4Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.45714 * NSWidth(frame), NSMinY(frame) + 0.91429 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.46454 * NSWidth(frame), NSMinY(frame) + 0.91357 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.46083 * NSWidth(frame), NSMinY(frame) + 0.91429 * NSHeight(frame))];
    [bezier4Path closePath];
    [bezier4Path setMiterLimit: 4];
    [NSGraphicsContext saveGraphicsState];
    [shadow set];
    [color0 setFill];
    [bezier4Path fill];
    [NSGraphicsContext restoreGraphicsState];
}

@end
