//
//  UserHeaderView.m
//  Ampz
//
//  Created by Maximilian Täschner on 19/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "UserHeaderView.h"

@implementation UserHeaderView

- (void)drawRect:(NSRect)dirtyRect {
    dirtyRect.size.height *= 0.7;
    [super drawRect:dirtyRect];
}

@end
