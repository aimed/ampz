//
//  BlurredImageLayer.h
//  Ampz
//
//  Created by Maximilian Täschner on 09/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

@interface BlurredImageLayer : CALayer
+(instancetype)layerWithImageForURL:(NSURL *)url inLayer:(CALayer *)parent ;
@end
