//
//  FitToParentView.m
//  Ampz
//
//  Created by Maximilian Täschner on 04/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "FitToParentView.h"

@implementation FitToParentView

-(void)viewDidMoveToSuperview {
    [super viewDidMoveToSuperview];
    if (self.superview != nil) {
        [self.superview setWantsLayer:YES];
        [self.superview addConstraint:[NSLayoutConstraint
                                       constraintWithItem:self
                                       attribute:NSLayoutAttributeTop
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.superview
                                       attribute:NSLayoutAttributeTop
                                       multiplier:1.0
                                       constant:0.0
                                       ]];
        
        // right
        [self.superview addConstraint:[NSLayoutConstraint
                                       constraintWithItem:self
                                       attribute:NSLayoutAttributeTrailing
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.superview
                                       attribute:NSLayoutAttributeTrailing
                                       multiplier:1.0
                                       constant:0.0
                                       ]];
        
        // bottom
        [self.superview addConstraint:[NSLayoutConstraint
                                       constraintWithItem:self
                                       attribute:NSLayoutAttributeBottom
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.superview
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:1.0
                                       constant:0.0
                                       ]];
        // left
        [self.superview addConstraint:[NSLayoutConstraint
                                       constraintWithItem:self
                                       attribute:NSLayoutAttributeLeading
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.superview
                                       attribute:NSLayoutAttributeLeading
                                       multiplier:1.0
                                       constant:0.0
                                       ]];
    } else {
        [self removeConstraints:self.constraints];
    }
    
}

-(BOOL)translatesAutoresizingMaskIntoConstraints {
    return NO;
}

/*
-(BOOL)allowsVibrancy {
    return YES;
}

-(NSVisualEffectBlendingMode)blendingMode {
    return NSVisualEffectBlendingModeBehindWindow;
}

*/

@end
