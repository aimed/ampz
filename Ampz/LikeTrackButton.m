//
//  StarButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 13/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "LikeTrackButton.h"
#import "ETSet.h"

@implementation LikeTrackButton
-(void)awakeFromNib {
    [super awakeFromNib];
    [self setTitle:@""];
    [self setBordered:NO];
}

-(void)onClick:(id)sender {
    BOOL yesOrNo = !self.liked;
    self.liked = yesOrNo;
    [self.representedObject favorite:yesOrNo
                             session:[ETSession activeSession]
                            complete:^(NSError *err, id result)
    {
        if (err) {
            NSLog(@"Error faving track %@",err);
            self.liked = !yesOrNo;
        }
    }];
}

-(void)setRepresentedObject:(ETTrack *)representedObject {
    [super setRepresentedObject:representedObject];
    self.liked = representedObject.favedBySessionUser;
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    NSColor* color0 = [self color];

    // Drawing code here.
    //// Bezier 2 Drawing
    NSBezierPath* bezier2Path = NSBezierPath.bezierPath;
    [bezier2Path moveToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.91887 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.39974 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.63825 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.34502 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.50005 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.08335 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.36359 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.34598 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.08333 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.40282 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.27966 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.61990 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.24466 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.91667 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.50247 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.78823 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.76106 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.91476 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.72411 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.61822 * NSHeight(dirtyRect))];
    [bezier2Path lineToPoint: NSMakePoint(NSMinX(dirtyRect) + 0.91887 * NSWidth(dirtyRect), NSMinY(dirtyRect) + 0.39974 * NSHeight(dirtyRect))];
    [bezier2Path closePath];
    [bezier2Path setMiterLimit: 4];
    [color0 setFill];
    [bezier2Path fill];

}

@end
