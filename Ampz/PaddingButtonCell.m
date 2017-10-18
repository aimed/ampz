//
//  PaddingButtonCell.m
//  Ampz
//
//  Created by Maximilian Täschner on 20/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "PaddingButtonCell.h"

@implementation PaddingButtonCell
-(NSSize)cellSize {
    NSSize size = [super cellSize];
    size.width += 10;
    size.height += 10;
    return size;
}
@end
