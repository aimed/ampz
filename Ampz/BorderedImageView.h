//
//  BorderedImageView.h
//  Ampz
//
//  Created by Maximilian Täschner on 20/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BorderedImageView : NSImageView
@property (nonatomic, strong) IBInspectable NSColor *borderColor;
@property (nonatomic, strong) IBInspectable NSNumber *borderWidth;
@end
