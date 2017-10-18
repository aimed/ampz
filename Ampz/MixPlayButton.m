//
//  MixPlayButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 06/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "MixPlayButton.h"
#import "PlayerController.h"

@interface MixPlayButton ()
-(void)setCover:(NSURL *)url;
-(void)onClick:(id)sender;
@end

@implementation MixPlayButton {
    NSImage *_img;
    NSTrackingArea *_trackingArea;
    BOOL _hasMouse;
}

+(void)initialize {
    [self exposeBinding:@"cover"];
    [self exposeBinding:@"mix"];
}

-(void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if (_hasMouse) {
        float size = NSHeight(dirtyRect)/3;
        float x = (NSWidth(dirtyRect) - size) / 2;
        float y = (NSHeight(dirtyRect) - size) / 2;
        NSRect btn = NSMakeRect(x, y, size, size);
        [self drawPlayWithFrame:btn];
    }
}

-(void)awakeFromNib {
    // prepare view and bind actions
    [self setTitle:@""];
    [self setBordered:NO];
    [self setTarget:self];
    [self setAction:@selector(onClick:)];
}

-(void)viewDidMoveToSuperview {
    [self updateTrackingAreas];
}

-(void)updateTrackingAreas {
    if (_trackingArea) {
        [self removeTrackingArea:_trackingArea];
    }
    _trackingArea = [[NSTrackingArea alloc]
                    initWithRect:[self bounds]
                    options:NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways
                    owner:self
                    userInfo:nil];
    [self addTrackingArea:_trackingArea];
    [super updateTrackingAreas];
}

-(void)mouseEntered:(NSEvent *)theEvent {
    _hasMouse = YES;
    [self setNeedsDisplay];
}

-(void)mouseExited:(NSEvent *)theEvent {
    _hasMouse = NO;
    [self setNeedsDisplay];
}

-(void)setMix:(ETMix *)mix {
    _mix = mix;
    NSURL *url = nil;
    if (NSWidth(self.frame) >= 500) {
        url = mix.cover.sq500;
    } else if (NSWidth(self.frame) >= 133) {
        url = mix.cover.sq250;
    } else {
        url = mix.cover.sq56;
    }
    [self setCover:url];
}

-(void)setCover:(NSURL *)url {
    [self setImage:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        if (connectionError || !data) {
            NSLog(@"Failed to load image");
            return;
        }
        _img = [[NSImage alloc] initWithData:data];
        [self setImage:_img];
    }];
}

-(void)onClick:(id)sender {
    if (_mix == nil) {
        return;
    }
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:PlaybackStateNotificationSetMix
     object:_mix];
}

- (void)drawPlayWithFrame: (NSRect)frame
{
    //// Color Declarations
    NSColor* color = [NSColor colorWithCalibratedRed: 1 green: 1 blue: 1 alpha: 1];
    
    NSShadow* shadow = NSShadow.alloc.init;
    [shadow setShadowColor: [NSColor.blackColor colorWithAlphaComponent: 0.3]];
    [shadow setShadowOffset: NSMakeSize(0.1, -1.1)];
    [shadow setShadowBlurRadius: 1];
    
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
    [shadow set];
    [color setFill];
    [bezier2Path fill];
    [NSGraphicsContext restoreGraphicsState];
}


@end
