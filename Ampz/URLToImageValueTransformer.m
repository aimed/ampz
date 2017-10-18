//
//  URLToImageValueTransformer.m
//  Ampz
//
//  Created by Maximilian Täschner on 16/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "URLToImageValueTransformer.h"
#import <Cocoa/Cocoa.h>
@implementation URLToImageValueTransformer
-(id)transformedValue:(id)value {
    if ([value isKindOfClass:[NSURL class]]) {
        return [[NSImage alloc] initByReferencingURL:value];
    }
    return nil;
}
@end
