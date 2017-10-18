//
//  HeartButton.h
//  Ampz
//
//  Created by Maximilian Täschner on 08/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ToggableUserActionButton.h"
#import "ETSet.h"

@interface LikeMixButton : ToggableUserActionButton
// TODO quick and dirty fix
@property IBInspectable NSColor *offStateColorDisabled;
@end
