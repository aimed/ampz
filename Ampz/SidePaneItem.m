//
//  SidePaneItem.m
//  Ampz
//
//  Created by Maximilian Täschner on 11/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "SidePaneItem.h"
#import "ETSmartID.h"

typedef enum : NSUInteger {
    SidePaneItemHeader,
    SidePaneItemSearch,
    SidePaneItemSmartID,
} SidePaneItemType;

@interface SidePaneItem ()
@property (assign) SidePaneItemType type;
-(instancetype)initWithTitle:(NSString *)title
                  andSmartID:(ETSmartID *)smartID
                    andItems:(NSArray *)items
               andSeachField:(NSSearchField *)seachField;
@end

@implementation SidePaneItem {
    ETSmartID *_smartID;
}

+(instancetype)smartIDItemWithTitle:(NSString *)title andSmartID:(ETSmartID *)smartID {
    SidePaneItem *item = [[SidePaneItem alloc] initWithTitle:title andSmartID:smartID andItems:nil andSeachField:nil];
    item.type = SidePaneItemSmartID;
    return item;
}

+(instancetype)headerItemWithTitle:(NSString *)title andItems:(NSArray *)items {
    SidePaneItem *item = [[SidePaneItem alloc] initWithTitle:title andSmartID:nil andItems:items andSeachField:nil];
    item.type = SidePaneItemHeader;
    return item;
}

+(instancetype)searchItemWithSeachField:(NSSearchField *)searchField {
    SidePaneItem *item = [[SidePaneItem alloc] initWithTitle:nil andSmartID:nil andItems:nil andSeachField:searchField];
    item.type = SidePaneItemSearch;
    return item;
}

-(ETSmartID *)smartID {
    if ([self isSmardIDItem]) {
        return _smartID;
    }
    if ([self isSearch]) {
        return [ETSmartID smartIDWithKeyword:_searchField.stringValue sortBy:ETSmartIDSortingHOT];
    }
    return nil;
}

-(instancetype)initWithTitle:(NSString *)title
                  andSmartID:(ETSmartID *)smartID
                    andItems:(NSArray *)items
               andSeachField:(NSSearchField *)seachField
{
    self = [super init];
    if (self)
    {
        _title = title;
        _smartID = smartID;
        if (items)
        {
            _items = [NSMutableArray arrayWithArray:items];
        }
        _searchField = seachField;
    }
    return self;
}

-(BOOL)isHeader {
    return _type == SidePaneItemHeader;
}

-(BOOL)isSmardIDItem {
    return _type == SidePaneItemSmartID;
}

-(BOOL)isSearch {
    return _type == SidePaneItemSearch;
}

-(NSString *)description {
    return _title;
}
@end
