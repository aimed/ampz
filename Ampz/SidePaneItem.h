//
//  SidePaneItem.h
//  Ampz
//
//  Created by Maximilian Täschner on 11/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@class ETSmartID;

@interface SidePaneItem : NSObject
@property (nonatomic, strong, readwrite) NSString *title;
@property (nonatomic, strong, readonly)  NSMutableArray *items;
@property (nonatomic, strong, readwrite)  NSSearchField *searchField;
+(instancetype)smartIDItemWithTitle:(NSString *)title andSmartID:(ETSmartID *)smartID;
+(instancetype)headerItemWithTitle:(NSString *)title andItems:(NSArray *)items;
+(instancetype)searchItemWithSeachField:(NSSearchField *)searchField;
-(BOOL)isHeader;
-(BOOL)isSmardIDItem;
-(BOOL)isSearch;
-(ETSmartID *)smartID;
@end
