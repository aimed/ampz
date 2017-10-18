//
//  PlayerView.m
//  Ampz
//
//  Created by Maximilian Täschner on 06/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "PlayerView.h"
#import "BlurredImageLayer.h"

@interface PlayerView ()
@end

@implementation PlayerView {
    BlurredImageLayer *imgLayer;
    CALayer *darkeningBackgroundLayer;
    
    NSTrackingArea *trackingArea;
    NSMutableArray *mouseOverViews;
    
    ETSet *_set;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    // tracking area
    [self addTrackingArea:trackingArea];
    
    // background image
    [self setWantsLayer:YES];
    [self setLayerUsesCoreImageFilters:YES];
    
    //
    // default background layer
    //
    CALayer *backgroundColorLayer = [CALayer layer];
    backgroundColorLayer.zPosition = -2;
    backgroundColorLayer.backgroundColor = [[NSColor colorWithSRGBRed:0.25 green:0.27 blue:0.31 alpha:1] CGColor];
    backgroundColorLayer.layoutManager  = [CAConstraintLayoutManager layoutManager];
    backgroundColorLayer.autoresizingMask = kCALayerHeightSizable | kCALayerWidthSizable;
    backgroundColorLayer.contentsGravity = kCAGravityResizeAspectFill;
    backgroundColorLayer.frame = self.frame;
    [self.layer addSublayer:backgroundColorLayer];
    
    //
    // darkening layer
    //
    darkeningBackgroundLayer = [CALayer layer];
    darkeningBackgroundLayer.backgroundColor = [[NSColor colorWithCalibratedWhite:0 alpha:0.1] CGColor];
    darkeningBackgroundLayer.zPosition = -0.5;
    [self.layer addSublayer:darkeningBackgroundLayer];
    
    // prepare views
    [self mouseExited:nil];
}

-(void)viewDidMoveToSuperview {
    [self updateTrackingAreas];
}

-(void)updateTrackingAreas {
    if (trackingArea) {
        [self removeTrackingArea:trackingArea];
    }
    trackingArea = [[NSTrackingArea alloc]
                    initWithRect:[self bounds]
                    options:NSTrackingMouseEnteredAndExited | NSTrackingActiveAlways
                    owner:self
                    userInfo:nil];
    [self addTrackingArea:trackingArea];
}

-(void)mouseEntered:(NSEvent *)theEvent {
    [_controlsContainer setAlphaValue:1.0f];
}

-(void)mouseExited:(NSEvent *)theEvent {
    [_controlsContainer setAlphaValue:0.8f];
}

-(void)setRepresentedSet:(ETSet *)set {
    _set = set;
}

#pragma mark Image

-(void)setBackgroundImageWithURL:(NSURL *)url {
    if (url) {
        if (imgLayer) {
            [imgLayer removeFromSuperlayer];
        }
        imgLayer = [BlurredImageLayer layerWithImageForURL:url inLayer:self.layer];
    }
}
@end
