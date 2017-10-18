//
//  LikeButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 14/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "ToggableUserActionButton.h"

@implementation ToggableUserActionButton
-(void)awakeFromNib {
    [self setTarget:self];
    [self setAction:@selector(onClick:)];
}

-(void)viewWillMoveToSuperview:(NSView *)newSuperview
{
    [self setEnabled:[self isEnabled]];
}

-(void)onClick:(id)sender {
}

-(BOOL)isEnabled {
    return _representedObject && [super isEnabled];
}

-(void)setRepresentedObject:(id)representedObject {
    [self willChangeValueForKey:@"representedObject"];
    _representedObject = representedObject;
    [self didChangeValueForKey:@"representedObject"];
    [self setEnabled:[self isEnabled]];
    [self setNeedsDisplay];
}

-(void)setLiked:(BOOL)liked {
    [self willChangeValueForKey:@"liked"];
    _liked = liked;
    [self didChangeValueForKey:@"liked"];
}

-(NSColor *)color {
    if (![self isEnabled]) {
        if (_disabledStateColor) {
            return _disabledStateColor;
        }
        if (_offStateColor) {
            return _offStateColor;
        }
    }
    if ([self liked] && _onStateColor)
    {
        return _onStateColor;
    }
    if (![self liked] && _offStateColor)
    {
        return _offStateColor;
    }
    return [NSColor blackColor];
}

@end
