//
//  NSMutableArray+RemoveObjectsAfterIndex.m
//  Ampz
//
//  Created by Maximilian Täschner on 22/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "NSMutableArray+RemoveObjectsAfterIndex.h"

@implementation NSMutableArray (RemoveObjectsAfterIndex)
-(void)removeObjectsAfterIndex:(NSUInteger)index {
    if (self.count == 0) {
        return;
    }
    
    NSUInteger nextIndex = index + 1;
    while (nextIndex <= self.count - 1) {
        [self removeObjectAtIndex:nextIndex];
    }
}
@end
