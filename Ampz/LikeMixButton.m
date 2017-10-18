//
//  HeartButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 08/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "LikeMixButton.h"
@interface LikeMixButton ()
@end
@implementation LikeMixButton

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setTitle:@""];
    [self setBordered:NO];
}
-(void)onClick:(id)sender {
    //
    // Like a mix
    //
    BOOL yesOrNo = !self.liked;
    self.liked = yesOrNo;
    [self.representedObject like:yesOrNo
                         session:[ETSession activeSession]
                        complete:^(NSError *err, id result)
    {
        if (err) {
            NSLog(@"Error liking mix %@",err);
            self.liked = !yesOrNo;
        }
    }];
}
-(BOOL)isEnabled {
    return [super isEnabled];
}
-(void)setRepresentedObject:(ETMix *)representedObject {
    [super setRepresentedObject:representedObject];
    self.liked = self.isEnabled && representedObject.likedBySessionUser;
}
#pragma mark Drawing

-(void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawHeartWithFrame:self.bounds];
}
- (void)drawHeartWithFrame: (NSRect)frame
{
    //// Color Declarations
    NSColor* color0 = [self color];
    
    //// Shadow Declarations
    //// Bezier 2 Drawing
    NSBezierPath* bezier2Path = NSBezierPath.bezierPath;
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(frame) + 0.95204 * NSWidth(frame), NSMinY(frame) + 0.37416 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.95176 * NSWidth(frame), NSMinY(frame) + 0.37414 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.95204 * NSWidth(frame), NSMinY(frame) + 0.36911 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.95183 * NSWidth(frame), NSMinY(frame) + 0.37244 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.95204 * NSWidth(frame), NSMinY(frame) + 0.37087 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.71129 * NSWidth(frame), NSMinY(frame) + 0.12840 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.95204 * NSWidth(frame), NSMinY(frame) + 0.23621 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.84417 * NSWidth(frame), NSMinY(frame) + 0.12840 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.52087 * NSWidth(frame), NSMinY(frame) + 0.22231 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.63369 * NSWidth(frame), NSMinY(frame) + 0.12840 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.56486 * NSWidth(frame), NSMinY(frame) + 0.16524 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.52058 * NSWidth(frame), NSMinY(frame) + 0.22219 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.52071 * NSWidth(frame), NSMinY(frame) + 0.22223 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.52064 * NSWidth(frame), NSMinY(frame) + 0.22223 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.50007 * NSWidth(frame), NSMinY(frame) + 0.23258 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.51575 * NSWidth(frame), NSMinY(frame) + 0.22840 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.50852 * NSWidth(frame), NSMinY(frame) + 0.23258 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.47937 * NSWidth(frame), NSMinY(frame) + 0.22167 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.49149 * NSWidth(frame), NSMinY(frame) + 0.23258 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.48415 * NSWidth(frame), NSMinY(frame) + 0.22811 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.47895 * NSWidth(frame), NSMinY(frame) + 0.22175 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.47937 * NSWidth(frame), NSMinY(frame) + 0.22167 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.47910 * NSWidth(frame), NSMinY(frame) + 0.22175 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.28903 * NSWidth(frame), NSMinY(frame) + 0.12840 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.43495 * NSWidth(frame), NSMinY(frame) + 0.16499 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.36626 * NSWidth(frame), NSMinY(frame) + 0.12840 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.04825 * NSWidth(frame), NSMinY(frame) + 0.36911 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.15603 * NSWidth(frame), NSMinY(frame) + 0.12840 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.04825 * NSWidth(frame), NSMinY(frame) + 0.23621 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.04847 * NSWidth(frame), NSMinY(frame) + 0.37401 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.04825 * NSWidth(frame), NSMinY(frame) + 0.37082 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.04847 * NSWidth(frame), NSMinY(frame) + 0.37236 * NSHeight(frame))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(frame) + 0.04812 * NSWidth(frame), NSMinY(frame) + 0.37416 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.04927 * NSWidth(frame), NSMinY(frame) + 0.39063 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.04812 * NSWidth(frame), NSMinY(frame) + 0.37416 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.04812 * NSWidth(frame), NSMinY(frame) + 0.38005 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.05630 * NSWidth(frame), NSMinY(frame) + 0.42981 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.05052 * NSWidth(frame), NSMinY(frame) + 0.40404 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.05299 * NSWidth(frame), NSMinY(frame) + 0.41717 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.34338 * NSWidth(frame), NSMinY(frame) + 0.80375 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.07503 * NSWidth(frame), NSMinY(frame) + 0.51064 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.13709 * NSWidth(frame), NSMinY(frame) + 0.66595 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.49919 * NSWidth(frame), NSMinY(frame) + 0.90699 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.46262 * NSWidth(frame), NSMinY(frame) + 0.88384 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.49157 * NSWidth(frame), NSMinY(frame) + 0.90549 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.50014 * NSWidth(frame), NSMinY(frame) + 0.90734 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.49955 * NSWidth(frame), NSMinY(frame) + 0.90703 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.49975 * NSWidth(frame), NSMinY(frame) + 0.90734 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.50124 * NSWidth(frame), NSMinY(frame) + 0.90687 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.50062 * NSWidth(frame), NSMinY(frame) + 0.90734 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.50081 * NSWidth(frame), NSMinY(frame) + 0.90699 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.65677 * NSWidth(frame), NSMinY(frame) + 0.80375 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.50933 * NSWidth(frame), NSMinY(frame) + 0.90493 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.53925 * NSWidth(frame), NSMinY(frame) + 0.88271 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.94113 * NSWidth(frame), NSMinY(frame) + 0.44095 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.85386 * NSWidth(frame), NSMinY(frame) + 0.67203 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.91934 * NSWidth(frame), NSMinY(frame) + 0.52433 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.95109 * NSWidth(frame), NSMinY(frame) + 0.38801 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.94640 * NSWidth(frame), NSMinY(frame) + 0.42409 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.94965 * NSWidth(frame), NSMinY(frame) + 0.40634 * NSHeight(frame))];
    [bezier2Path curveToPoint: NSMakePoint(NSMinX(frame) + 0.95204 * NSWidth(frame), NSMinY(frame) + 0.37416 * NSHeight(frame)) controlPoint1: NSMakePoint(NSMinX(frame) + 0.95199 * NSWidth(frame), NSMinY(frame) + 0.37920 * NSHeight(frame)) controlPoint2: NSMakePoint(NSMinX(frame) + 0.95204 * NSWidth(frame), NSMinY(frame) + 0.37416 * NSHeight(frame))];
    [bezier2Path closePath];
    [bezier2Path setMiterLimit: 4];
    [NSGraphicsContext saveGraphicsState];
    [color0 setFill];
    [bezier2Path fill];
    [NSGraphicsContext restoreGraphicsState];
}


@end
