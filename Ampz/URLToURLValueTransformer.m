//
//  URLToURLValueTransformer.m
//  Ampz
//
//  Created by Maximilian Täschner on 16/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "URLToURLValueTransformer.h"

@implementation URLToURLValueTransformer
-(id)transformedValue:(id)value {
    if ([value isKindOfClass:[NSURL class]]) {
        return value;
    }
    return nil;
}
@end
