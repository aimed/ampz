//
//  HomeController.m
//  Ampz
//
//  Created by Maximilian Täschner on 02/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "MixListController.h"
#import "ETSet.h"
#import "ETUser.h"
#import "ETMix.h"
#import "ETPaginator.h"
#import "ETSession.h"
#import "MixListItemView.h"
#import "PlayerController.h"
#import "ErrorController.h"

@class ETUser;

@interface MixListController ()
//-(void)showMix:(id)sender;
-(void)fetchMixesWithPaginator:(ETPaginator *)paginator;
-(void)scrollViewDidEndLiveScroll:(NSNotification *)aNotification;
@end

@implementation MixListController {
    NSMutableOrderedSet *_mixes;
    ETPaginator *_paginator;
    ETSmartID *_smartID;
    BOOL _isFetchingMore;
}

-(void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(scrollViewDidEndLiveScroll:)
     name:NSScrollViewDidEndLiveScrollNotification
     object:_scrollView];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)scrollViewDidEndLiveScroll:(NSNotification *)aNotification {
    NSScrollView *scrollView = aNotification.object;
    float scrollpos = [[scrollView verticalScroller] floatValue];
    
    if ((int)scrollpos == 1 && _paginator && !_paginator.atEnd && _smartID && _mixes != nil)
    {
        [_paginator nextPage];
        [self fetchMixesWithPaginator:_paginator];
    }
}

-(void)representPageItemEmpty:(PageItem *)pageItem {
    _smartID = pageItem.representedObject;
    _isFetchingMore = NO;
    
    // placeholder
    _mixes = [NSMutableOrderedSet new];
    _paginator = [ETPaginator new];
    pageItem.data = @{@"mixes":_mixes, @"paginator":_paginator};
    
    
    [_mixTable reloadData];
    [self fetchMixesWithPaginator:_paginator];
}

-(void)representPageItemWithData:(PageItem *)pageItem {
    _isFetchingMore = NO;
    _mixes = pageItem.data[@"mixes"];
    _paginator = pageItem.data[@"paginator"];
    [_mixTable reloadData];
}


-(void)fetchMixesWithPaginator:(ETPaginator *)paginator {
    if (_isFetchingMore) {
        return;
    }
    _isFetchingMore = YES;
    [ETMix mixSetBySmartID:_smartID
                  includes:@"mixes[user,cover_images,liked]"
             paginator:_paginator
                   session:[ETSession activeSession]
                  complete:^(NSError *err, id result)
     {
         if (err)
         {
             NSLog(@"Error loading mixset%@", err);
             [ErrorController showError:err];
             [_paginator previousPage];
         }
         
         // got more entries
         [_mixes addObjectsFromArray:result];
         
         [_mixTable reloadData];
         _isFetchingMore = NO;
     }];
}

#pragma mark TABLE_VIEW_DELEGATE

-(NSView *)tableView:(NSTableView *)tableView
  viewForTableColumn:(NSTableColumn *)tableColumn
                 row:(NSInteger)row {
    // placeholder
    if (_mixes == nil || row >= _mixes.count)
    {
        return [_mixTable makeViewWithIdentifier:@"PlaceHolderView" owner:self];
    }
    
    MixListItemView *view = [_mixTable makeViewWithIdentifier:@"mixListItemView" owner:self];
    id object = [self tableView:tableView objectValueForTableColumn:tableColumn row:row];
    [view setRepresentedObject:object];
    return view;
}

#pragma mark TABLE_VIEW_DATASOURCE

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    NSInteger number = 0; // placeholder
    
    if (_mixes != nil)
    {
        number = [_mixes count];
    }
    else
    {
        return 5;
    }
    
    return number + ((_paginator && _paginator.atEnd) || (_mixes != nil && _mixes.count == 0) ? 0 : 2);
}

-(CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row {
    return 70;
}

-(id)tableView:(NSTableView *)tableView
objectValueForTableColumn:(NSTableColumn *)tableColumn
           row:(NSInteger)row {
    if (_mixes == nil || row >= _mixes.count)
    {
        return nil;
    }
    return [_mixes objectAtIndex:row];
}

@end
