//
//  NumberToStringValueTransformer.m
//  Ampz
//
//  Created by Maximilian Täschner on 16/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "NumberToStringValueTransformer.h"

@implementation NumberToStringValueTransformer
-(id)transformedValue:(id)value {
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    return nil;
}
@end
