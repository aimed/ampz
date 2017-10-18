//
//  SkipButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 06/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "SkipButton.h"

@implementation SkipButton

-(void)awakeFromNib {
    [self setTitle:@""];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawSkipWithFrame:dirtyRect];
}

- (void)drawSkipWithFrame: (NSRect)frame
{
    NSShadow* shadow = NSShadow.alloc.init;
    [shadow setShadowColor: [NSColor.blackColor colorWithAlphaComponent: 0.3]];
    [shadow setShadowOffset: NSMakeSize(0.1, -1.1)];
    [shadow setShadowBlurRadius: 1];
    
    //// Bezier 2 Drawing
    NSBezierPath* bezier2Path = NSBezierPath.bezierPath;
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.82914 * NSWidth(frame), NSMinY(frame) + 0.96669 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.70659 * NSWidth(frame), NSMinY(frame) + 0.96669 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.62490 * NSWidth(frame), NSMinY(frame) + 0.88512 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.66147 * NSWidth(frame), NSMinY(frame) + 0.96669 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.62490 * NSWidth(frame), NSMinY(frame) + 0.93018 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.62490 * NSWidth(frame), NSMinY(frame) + 0.60014 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.20376 * NSWidth(frame), NSMinY(frame) + 0.95520 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.15322 * NSWidth(frame), NSMinY(frame) + 0.96434 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.18786 * NSWidth(frame), NSMinY(frame) + 0.96617 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.16813 * NSWidth(frame), NSMinY(frame) + 0.96434 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.09387 * NSWidth(frame), NSMinY(frame) + 0.89750 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.09361 * NSWidth(frame), NSMinY(frame) + 0.96434 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.09387 * NSWidth(frame), NSMinY(frame) + 0.91102 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.09387 * NSWidth(frame), NSMinY(frame) + 0.09549 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.15322 * NSWidth(frame), NSMinY(frame) + 0.02866 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.09387 * NSWidth(frame), NSMinY(frame) + 0.08407 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.09361 * NSWidth(frame), NSMinY(frame) + 0.02866 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.20376 * NSWidth(frame), NSMinY(frame) + 0.03779 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.16813 * NSWidth(frame), NSMinY(frame) + 0.02866 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.18786 * NSWidth(frame), NSMinY(frame) + 0.02683 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.62491 * NSWidth(frame), NSMinY(frame) + 0.39285 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.62491 * NSWidth(frame), NSMinY(frame) + 0.11023 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.70660 * NSWidth(frame), NSMinY(frame) + 0.02866 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.62491 * NSWidth(frame), NSMinY(frame) + 0.06518 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.66148 * NSWidth(frame), NSMinY(frame) + 0.02866 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.82915 * NSWidth(frame), NSMinY(frame) + 0.02866 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.91084 * NSWidth(frame), NSMinY(frame) + 0.11023 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.87427 * NSWidth(frame), NSMinY(frame) + 0.02866 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.91084 * NSWidth(frame), NSMinY(frame) + 0.06518 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.91084 * NSWidth(frame), NSMinY(frame) + 0.88512 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.82914 * NSWidth(frame), NSMinY(frame) + 0.96669 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.91084 * NSWidth(frame), NSMinY(frame) + 0.93018 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.87427 * NSWidth(frame), NSMinY(frame) + 0.96669 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path setMiterLimit: 4];
    [bezier2Path setWindingRule: NSEvenOddWindingRule];
    [NSGraphicsContext saveGraphicsState];
    [shadow set];
    if (self.enabled) {
        [NSColor.whiteColor setFill];
    } else {
        [[NSColor colorWithCalibratedWhite:1.0f alpha:0.5f] setFill];
    }
    [bezier2Path fill];
    [NSGraphicsContext restoreGraphicsState];
}


@end
