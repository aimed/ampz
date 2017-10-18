//
//  DiscussionButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "DiscussionButton.h"

@implementation DiscussionButton

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setTitle:@""];
    [self setBordered:NO];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawBubblesWithFrame:dirtyRect];
}

- (void)drawBubblesWithFrame: (NSRect)frame
{
    //// Color Declarations
    NSColor* color0 = _color ? _color : [NSColor colorWithCalibratedRed: 0.205 green: 0.205 blue: 0.205 alpha: 1];
    
    NSBezierPath* bezier2Path = NSBezierPath.bezierPath;
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.87657 * NSWidth(frame), NSMinY(frame) + 0.78259 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.92500 * NSWidth(frame), NSMinY(frame) + 0.86127 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.87657 * NSWidth(frame), NSMinY(frame) + 0.81695 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.89626 * NSWidth(frame), NSMinY(frame) + 0.84670 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.92500 * NSWidth(frame), NSMinY(frame) + 0.87331 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.90040 * NSWidth(frame), NSMinY(frame) + 0.87500 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.91696 * NSWidth(frame), NSMinY(frame) + 0.87440 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.90875 * NSWidth(frame), NSMinY(frame) + 0.87500 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.76970 * NSWidth(frame), NSMinY(frame) + 0.81891 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.84895 * NSWidth(frame), NSMinY(frame) + 0.87500 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.80253 * NSWidth(frame), NSMinY(frame) + 0.85344 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.70706 * NSWidth(frame), NSMinY(frame) + 0.82703 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.74987 * NSWidth(frame), NSMinY(frame) + 0.82418 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.72883 * NSWidth(frame), NSMinY(frame) + 0.82703 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.48914 * NSWidth(frame), NSMinY(frame) + 0.63371 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.58670 * NSWidth(frame), NSMinY(frame) + 0.82703 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.48914 * NSWidth(frame), NSMinY(frame) + 0.74047 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.70706 * NSWidth(frame), NSMinY(frame) + 0.44039 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.48914 * NSWidth(frame), NSMinY(frame) + 0.52695 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.58670 * NSWidth(frame), NSMinY(frame) + 0.44039 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.92498 * NSWidth(frame), NSMinY(frame) + 0.63371 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.82742 * NSWidth(frame), NSMinY(frame) + 0.44039 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.92498 * NSWidth(frame), NSMinY(frame) + 0.52695 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.88461 * NSWidth(frame), NSMinY(frame) + 0.74584 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.92498 * NSWidth(frame), NSMinY(frame) + 0.67552 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.91001 * NSWidth(frame), NSMinY(frame) + 0.71420 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.87655 * NSWidth(frame), NSMinY(frame) + 0.78262 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.87946 * NSWidth(frame), NSMinY(frame) + 0.75702 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.87655 * NSWidth(frame), NSMinY(frame) + 0.76949 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.87657 * NSWidth(frame), NSMinY(frame) + 0.78259 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.44074 * NSWidth(frame), NSMinY(frame) + 0.10207 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.82803 * NSWidth(frame), NSMinY(frame) + 0.40830 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.65144 * NSWidth(frame), NSMinY(frame) + 0.10207 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.82285 * NSWidth(frame), NSMinY(frame) + 0.23846 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.70708 * NSWidth(frame), NSMinY(frame) + 0.38299 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.79081 * NSWidth(frame), NSMinY(frame) + 0.39174 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.74965 * NSWidth(frame), NSMinY(frame) + 0.38299 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.51479 * NSWidth(frame), NSMinY(frame) + 0.45411 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.63478 * NSWidth(frame), NSMinY(frame) + 0.38299 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.56648 * NSWidth(frame), NSMinY(frame) + 0.40825 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.43166 * NSWidth(frame), NSMinY(frame) + 0.63371 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.46118 * NSWidth(frame), NSMinY(frame) + 0.50167 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.43166 * NSWidth(frame), NSMinY(frame) + 0.56544 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.45266 * NSWidth(frame), NSMinY(frame) + 0.73020 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.43166 * NSWidth(frame), NSMinY(frame) + 0.66744 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.43888 * NSWidth(frame), NSMinY(frame) + 0.70009 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.44074 * NSWidth(frame), NSMinY(frame) + 0.73037 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.44871 * NSWidth(frame), NSMinY(frame) + 0.73030 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.44474 * NSWidth(frame), NSMinY(frame) + 0.73037 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.38033 * NSWidth(frame), NSMinY(frame) + 0.72655 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.42019 * NSWidth(frame), NSMinY(frame) + 0.73037 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.40002 * NSWidth(frame), NSMinY(frame) + 0.72907 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.10176 * NSWidth(frame), NSMinY(frame) + 0.82669 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.29711 * NSWidth(frame), NSMinY(frame) + 0.80961 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.19779 * NSWidth(frame), NSMinY(frame) + 0.82449 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.10176 * NSWidth(frame), NSMinY(frame) + 0.80637 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.19861 * NSWidth(frame), NSMinY(frame) + 0.68204 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.15363 * NSWidth(frame), NSMinY(frame) + 0.78102 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.19861 * NSWidth(frame), NSMinY(frame) + 0.73482 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.19697 * NSWidth(frame), NSMinY(frame) + 0.66036 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.19861 * NSWidth(frame), NSMinY(frame) + 0.67467 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.19803 * NSWidth(frame), NSMinY(frame) + 0.66744 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.05334 * NSWidth(frame), NSMinY(frame) + 0.41622 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.10934 * NSWidth(frame), NSMinY(frame) + 0.60278 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.05334 * NSWidth(frame), NSMinY(frame) + 0.51479 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.44074 * NSWidth(frame), NSMinY(frame) + 0.10207 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.05334 * NSWidth(frame), NSMinY(frame) + 0.24271 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.22677 * NSWidth(frame), NSMinY(frame) + 0.10207 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path setMiterLimit: 4];
    [color0 setFill];
    [bezier2Path fill];
}

@end
