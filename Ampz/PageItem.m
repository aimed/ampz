//
//  PageItem.m
//  Ampz
//
//  Created by Maximilian Täschner on 21/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "PageItem.h"

@implementation PageItem
+(instancetype)pageItemWithRepresentedObject:(id)representedObject {
    PageItem *item = [PageItem new];
    item.representedObject = representedObject;
    return item;
}
@end
