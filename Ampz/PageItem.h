//
//  PageItem.h
//  Ampz
//
//  Created by Maximilian Täschner on 21/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PageItem;

@protocol PageItemController <NSObject>
-(void)representPageItemEmpty:(PageItem *)pageItem;
-(void)representPageItemWithData:(PageItem *)pageItem;
@end

@interface PageItem : NSObject
@property (nonatomic, strong) id representedObject;
@property (nonatomic, strong) id data;
+(instancetype)pageItemWithRepresentedObject:(id)representedObject;
@end