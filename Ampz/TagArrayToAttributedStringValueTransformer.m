//
//  TagArrayToStringValueTransformer.m
//  Ampz
//
//  Created by Maximilian Täschner on 20/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "TagArrayToAttributedStringValueTransformer.h"
#import "ETSmartID.h"
#import "NSAttributedString+Hyperlink.h"

@implementation TagArrayToAttributedStringValueTransformer
-(NSAttributedString *)transformedValue:(NSArray *)components
{
    NSMutableAttributedString *string = [NSMutableAttributedString new];
    for (NSUInteger i = 0; i < components.count; i++)
    {
        @autoreleasepool
        {
            NSString *tag = [components objectAtIndex:i];
            NSString *urlString = [NSString stringWithFormat:@"ampz://smartID/tags:%@",[ETSmartID encodeSlug:tag]];
            NSURL *url = [NSURL URLWithString:urlString];
            NSAttributedString *tagURL = [NSAttributedString hyperlinkFromString:tag withURL:url];
            [string appendAttributedString:tagURL];
            if (i < (components.count - 1))
            {
                NSAttributedString *comma = [[NSAttributedString alloc] initWithString:@", "];
                [string appendAttributedString:comma];
            }
        }
    }
    
    return string;
}
@end
