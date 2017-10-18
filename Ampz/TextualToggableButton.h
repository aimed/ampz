//
//  TextualToggableButton.h
//  Ampz
//
//  Created by Maximilian Täschner on 20/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "ToggableUserActionButton.h"

@interface TextualToggableButton : ToggableUserActionButton
@property (nonatomic, strong) IBInspectable NSColor *onStateTextColor;
@property (nonatomic, strong) IBInspectable NSColor *offStateTextColor;
@property (nonatomic, strong) IBInspectable NSColor *disabledStateTextColor;
@property (nonatomic, strong) IBInspectable NSString *onStateText;
@property (nonatomic, strong) IBInspectable NSString *offStateText;
-(NSColor *)textColor;
@end
