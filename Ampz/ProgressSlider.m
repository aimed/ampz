//
//  ProgressSlider.m
//  Ampz
//
//  Created by Maximilian Täschner on 06/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "ProgressSlider.h"

@implementation ProgressSlider

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(void)viewDidMoveToSuperview {
    [self setEnabled:NO];
}

@end
