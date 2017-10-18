//
//  PageControllerView.m
//  Ampz
//
//  Created by Maximilian Täschner on 19/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "PageControllerView.h"
#define kSwipeMinimumLength 20

typedef enum : NSUInteger {
    ScrollEventNULL,
    ScrollEventBackwards,
    ScrollEventForwards,
} ScrollEvent;

@implementation PageControllerView {
    BOOL _scrolling;
    ScrollEvent _scrollEventType;
}

-(void)awakeFromNib {
    _scrolling = NO;
    _scrollEventType = ScrollEventNULL;
    
}

-(void)beginGestureWithEvent:(NSEvent *)theEvent {
    if (!_scrolling && _scrollEventType == ScrollEventNULL)
    {
        _scrolling = YES;
        return;
    }
}


-(void)scrollWheel:(NSEvent *)theEvent {
    if (!_scrolling) {
        return;
    }
    
    
    CGFloat distance = theEvent.scrollingDeltaX;
    
    if (distance < -kSwipeMinimumLength)
    {
        _scrollEventType = ScrollEventForwards;
    }
    else if (distance > kSwipeMinimumLength)
    {
        _scrollEventType = ScrollEventBackwards;
    }
}

-(void)endGestureWithEvent:(NSEvent *)event {
    if (_delegate && _scrollEventType == ScrollEventBackwards)
    {
        [_delegate backwards];
    }
    else if (_delegate && _scrollEventType == ScrollEventForwards)
    {
        [_delegate forwards];
    }
    
    _scrolling = NO;
    _scrollEventType = ScrollEventNULL;
}

@end
