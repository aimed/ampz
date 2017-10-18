//
//  PromotingScrollView.m
//  Ampz
//
//  Created by Maximilian Täschner on 22/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "PromotingScrollView.h"

@implementation PromotingScrollView

-(void)scrollWheel:(NSEvent *)theEvent {
    [super scrollWheel:theEvent];
    [self.nextResponder scrollWheel:theEvent];
}
-(void)endGestureWithEvent:(NSEvent *)event {
    [super endGestureWithEvent:event];
    [self.nextResponder endGestureWithEvent:event];
}
@end
