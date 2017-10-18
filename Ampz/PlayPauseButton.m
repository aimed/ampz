//
//  PlayPauseButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 06/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "PlayPauseButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation PlayPauseButton {
    CAShapeLayer *playLayer;
    CAShapeLayer *pauseLayer;
}

-(void)awakeFromNib {
    _isPlaying = NO;
    [self setTitle:@""];
    [self setWantsLayer:YES];
    [self.layer setMasksToBounds:YES];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if (_isPlaying) {
        [self drawPauseWithFrame:dirtyRect];
    } else {
        [self drawPlayWithFrame:dirtyRect];
    }
}

-(void)setIsPlaying:(BOOL)isPlaying {
    _isPlaying = isPlaying;
    [self setNeedsDisplay];
}

- (void)drawPlayWithFrame: (NSRect)frame
{
    //// Color Declarations
    NSColor* color = _color ? _color : [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Bezier 2 Drawing
    NSBezierPath* bezier2Path = NSBezierPath.bezierPath;
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.23894 * NSWidth(frame), NSMinY(frame) + 0.92939 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.09019 * NSWidth(frame), NSMinY(frame) + 0.84415 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.15679 * NSWidth(frame), NSMinY(frame) + 0.97602 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.09019 * NSWidth(frame), NSMinY(frame) + 0.93782 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.09019 * NSWidth(frame), NSMinY(frame) + 0.15287 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.23894 * NSWidth(frame), NSMinY(frame) + 0.06754 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.09019 * NSWidth(frame), NSMinY(frame) + 0.05910 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.15679 * NSWidth(frame), NSMinY(frame) + 0.02096 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.84958 * NSWidth(frame), NSMinY(frame) + 0.41405 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.84958 * NSWidth(frame), NSMinY(frame) + 0.58289 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.93175 * NSWidth(frame), NSMinY(frame) + 0.46069 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.93175 * NSWidth(frame), NSMinY(frame) + 0.53626 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.23894 * NSWidth(frame), NSMinY(frame) + 0.92939 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path setMiterLimit: 4];
    [NSGraphicsContext saveGraphicsState];
    [color setFill];
    [bezier2Path fill];
    [NSGraphicsContext restoreGraphicsState];
}


- (void)drawPauseWithFrame: (NSRect)frame
{
    //// Color Declarations
    NSColor* color2 = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 1];
    //// Bezier 3 Drawing
    NSBezierPath* bezier3Path = NSBezierPath.bezierPath;
    [bezier3Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.35506 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame))];
    [bezier3Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.17229 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame))];
    [bezier3Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.09919 * NSWidth(frame), NSMinY(frame) + 0.89985 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.13192 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.09919 * NSWidth(frame), NSMinY(frame) + 0.94017 * NSHeight(frame))];
    [bezier3Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.09919 * NSWidth(frame), NSMinY(frame) + 0.09662 * NSHeight(frame))];
    [bezier3Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.17229 * NSWidth(frame), NSMinY(frame) + 0.02361 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.09919 * NSWidth(frame), NSMinY(frame) + 0.05630 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.13192 * NSWidth(frame), NSMinY(frame) + 0.02361 * NSHeight(frame))];
    [bezier3Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.35506 * NSWidth(frame), NSMinY(frame) + 0.02361 * NSHeight(frame))];
    [bezier3Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.42816 * NSWidth(frame), NSMinY(frame) + 0.09662 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.39543 * NSWidth(frame), NSMinY(frame) + 0.02361 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.42816 * NSWidth(frame), NSMinY(frame) + 0.05630 * NSHeight(frame))];
    [bezier3Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.42816 * NSWidth(frame), NSMinY(frame) + 0.89985 * NSHeight(frame))];
    [bezier3Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.35506 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.42816 * NSWidth(frame), NSMinY(frame) + 0.94017 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.39543 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame))];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.83024 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame))];
    [bezier3Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.64748 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame))];
    [bezier3Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.57437 * NSWidth(frame), NSMinY(frame) + 0.89985 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.60710 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.57437 * NSWidth(frame), NSMinY(frame) + 0.94017 * NSHeight(frame))];
    [bezier3Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.57437 * NSWidth(frame), NSMinY(frame) + 0.09662 * NSHeight(frame))];
    [bezier3Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.64748 * NSWidth(frame), NSMinY(frame) + 0.02361 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.57437 * NSWidth(frame), NSMinY(frame) + 0.05630 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.60710 * NSWidth(frame), NSMinY(frame) + 0.02361 * NSHeight(frame))];
    [bezier3Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.83024 * NSWidth(frame), NSMinY(frame) + 0.02361 * NSHeight(frame))];
    [bezier3Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.90334 * NSWidth(frame), NSMinY(frame) + 0.09662 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.87061 * NSWidth(frame), NSMinY(frame) + 0.02361 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.90334 * NSWidth(frame), NSMinY(frame) + 0.05630 * NSHeight(frame))];
    [bezier3Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.90334 * NSWidth(frame), NSMinY(frame) + 0.89985 * NSHeight(frame))];
    [bezier3Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.83024 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.90335 * NSWidth(frame), NSMinY(frame) + 0.94017 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.87061 * NSWidth(frame), NSMinY(frame) + 0.97287 * NSHeight(frame))];
    [bezier3Path closePath];
    [bezier3Path setMiterLimit: 4];
    [bezier3Path setWindingRule: NSEvenOddWindingRule];
    [NSGraphicsContext saveGraphicsState];
    [color2 setFill];
    [bezier3Path fill];
    [NSGraphicsContext restoreGraphicsState];
}



@end
