//
//  BorderedImageView.m
//  Ampz
//
//  Created by Maximilian Täschner on 20/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "BorderedImageView.h"

CGFloat kBorderedImageViewDefaultBorderWidth = 5.0f;

@implementation BorderedImageView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (_borderColor)
    {
        [self setWantsLayer:YES];
        self.layer.masksToBounds = YES;
        self.layer.borderWidth = _borderWidth ? _borderWidth.floatValue : kBorderedImageViewDefaultBorderWidth;
        self.layer.borderColor = [_borderColor CGColor];
    }
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

@end
