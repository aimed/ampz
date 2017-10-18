//
//  SidePaneController.m
//  Ampz
//
//  Created by Maximilian Täschner on 11/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "SidePaneController.h"
#import "AmpzNotificationCentral.h"
#import "SidePaneItem.h"
#import "SidePaneItemView.h"
#import "SidePaneHeaderView.h"
#import "ETSmartID.h"
#import "ETSession.h"
#import "ETUser.h"
#import "ETMixSet.h"
#import "ETCollection.h"
#import "SessionObserver.h"

NSString *const kSidePaneShouldClearSelected = @"kSidePaneShouldClearSelected";

@interface SidePaneController () <SessionObserverDelegate>
@property (nonatomic, strong) NSMutableArray *sidePaneItems;
-(void)selectItem:(id)item;
-(id)selectedItem;
-(void)clearSelection:(NSNotification *)aNotification;
@end

@implementation SidePaneController {
    BOOL waitingForSession;
    SidePaneItem *sidePaneExplore;
    SidePaneItem *sidePaneUser;
    SidePaneItem *sidePaneCollection;
    SidePaneItem *searchPaneItem;
}



# pragma mark Setup

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //
    // create sidepanes
    //
    _sidePaneItems = [NSMutableArray new];
    
    // search sidepane
    searchPaneItem = [SidePaneItem searchItemWithSeachField:_searchField];
    [_sidePaneItems addObject:searchPaneItem];
    
    //
    // explore sidepane
    //
    NSMutableArray *explore = [NSMutableArray new];
    [explore addObject:[SidePaneItem smartIDItemWithTitle:@"Hot"
                                                andSmartID:[ETSmartID smartIDAllSortBy:ETSmartIDSortingHOT]]];
    [explore addObject:[SidePaneItem smartIDItemWithTitle:@"Popular"
                                                andSmartID:[ETSmartID smartIDAllSortBy:ETSmartIDSortingPOPULAR]]];
    [explore addObject:[SidePaneItem smartIDItemWithTitle:@"Recent"
                                                andSmartID:[ETSmartID smartIDAllSortBy:ETSmartIDSortingRECENT]]];
    sidePaneExplore = [SidePaneItem headerItemWithTitle:@"Explore" andItems:explore];
   [_sidePaneItems addObject:sidePaneExplore];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(clearSelection:)
     name:kSidePaneShouldClearSelected
     object:nil];
    
    waitingForSession = [SessionObserver hasSession];
    [SessionObserver subscribe:self];
}

-(void)dealloc {
    [SessionObserver unsubscribe:self];
}


-(void)viewDidAppear {
    [_sidePaneView expandItem:nil expandChildren:YES];
    // select default pane
    if (!waitingForSession && ![_sidePaneView itemAtRow:[_sidePaneView selectedRow]])
    {
        [self selectItem:[sidePaneExplore.items objectAtIndex:0]];
    }
}



# pragma mark Selecting Items

-(void)selectItem:(id)item {
    NSInteger rowToSelect = [_sidePaneView rowForItem:item];
    [_sidePaneView selectRowIndexes:[NSIndexSet indexSetWithIndex:rowToSelect]
               byExtendingSelection:NO];
}

-(id)selectedItem {
    return [_sidePaneView itemAtRow:[_sidePaneView selectedRow]];
}

-(void)clearSelection:(NSNotification *)aNotification {
    [_sidePaneView deselectAll:nil];
    [_searchField resignFirstResponder];
}



#pragma mark Handling Sessions

//
// Handle session state changes, to show a user based collections
//
-(void)sessionInitialized:(ETSession *)session
{
    
}

-(void)sessionValidated:(ETSession *)session
{
    id selectedItem = [self selectedItem];
    
    NSMutableArray *user = [NSMutableArray new];
    [user addObject:[SidePaneItem smartIDItemWithTitle:@"Recommended"
                                            andSmartID:[ETSmartID smartIDRecommended]]];
    [user addObject:[SidePaneItem smartIDItemWithTitle:@"Liked"
                                            andSmartID:[ETSmartID smartIDWithLikedBy:[ETSession activeSession].user]]];
    [user addObject:[SidePaneItem smartIDItemWithTitle:@"Listened"
                                            andSmartID:[ETSmartID smartIDListened]]];
    sidePaneUser = [SidePaneItem headerItemWithTitle:@"" andItems:user];
    
    // add to sidepane
    if (![_sidePaneItems containsObject:sidePaneUser])
    {
        [_sidePaneItems addObject:sidePaneUser];
    }
    
    [sidePaneUser setTitle:session.user.login];
    
    // add collections
    NSMutableArray *collectionItems = [NSMutableArray new];
    for (ETMixSet *set in session.user.collections) {
        @autoreleasepool {
            [collectionItems addObject:[SidePaneItem smartIDItemWithTitle:set.name
                                                               andSmartID:set.smartID]];
        }
    }
    sidePaneCollection = [SidePaneItem headerItemWithTitle:@"Collections" andItems:collectionItems];
    [_sidePaneItems addObject:sidePaneCollection];

    
    [_sidePaneView reloadData];
    [_sidePaneView expandItem:nil expandChildren:YES];
    
    // select default item
    if (waitingForSession && !selectedItem)
    {
        [self selectItem:[sidePaneUser.items objectAtIndex:0]];
    }
    waitingForSession = NO;
}

-(void)sessionInvalidated:(ETSession *)session
{
    id selectedItem = [self selectedItem];
    
    [self selectItem:[sidePaneExplore.items objectAtIndex:0]];
    [_sidePaneItems removeObject:sidePaneUser];
    [_sidePaneItems removeObject:sidePaneCollection];
    
    [_sidePaneView reloadData];
    [_sidePaneView expandItem:nil expandChildren:YES];
    
    waitingForSession = NO;
    
    // reset selected item if needed
    if (selectedItem != nil && [_sidePaneView selectedRow] < 0)
    {
        [self selectItem:[sidePaneExplore.items objectAtIndex:0]];
    }
}



#pragma mark Searching
//
// Perform searches
//
-(void)search:(id)sender {
    [self outlineViewSelectionDidChange:nil];
}

//
//
// Outline View
//
//
#pragma mark OutlineView DataSource

-(BOOL)outlineView:(NSOutlineView *)outlineView
  isItemExpandable:(SidePaneItem *)item
{
    return item == nil || item.isHeader;
}

-(NSInteger)outlineView:(NSOutlineView *)outlineView
 numberOfChildrenOfItem:(SidePaneItem *)item
{
    NSInteger childs = 0;
    if (item == nil) {
        // top level object
        childs = _sidePaneItems.count;
    }
    else if (item.isHeader)
    {
        // header
        childs = [item.items count];
    }
    // 0 if searchpaneitem or unknown
    return childs;
}

-(id)outlineView:(NSOutlineView *)outlineView
           child:(NSInteger)index
          ofItem:(SidePaneItem *)item
{
    id child = nil;
    if (item == nil)
    {
        // top level
        child = [_sidePaneItems objectAtIndex:index];
    }
    else
    {
        // sidepaneitem
        child = [item.items objectAtIndex:index];
    }
    return child;
}

#pragma mark OutlineView Delegate

-(void)outlineViewSelectionDidChange:(NSNotification *)notification
{
    // TODO
    // use naviation
    waitingForSession = NO;
    SidePaneItem *selection = [_sidePaneView itemAtRow:[_sidePaneView selectedRow]];
    
    // do nothing if deselected or same item selected
    if (selection == nil)
    {
        return;
    }
    
    // search field
    if (selection.isSearch)
    {
        // stop if nothing is enthere
        if ([_searchField.stringValue isEqualTo:@""])
        {
            return;
        }
        
        // reselect searchfiled
        [_searchField selectText:nil];
        [[_searchField currentEditor] setSelectedRange:NSMakeRange([[_searchField stringValue] length], 0)];
    }
    
    [AmpzNotificationCentral navigationNotification:selection.smartID];
}

-(BOOL)outlineView:(NSOutlineView *)outlineView
  shouldSelectItem:(SidePaneItem *)item
{
    return item.isSearch || item.isSmardIDItem;
}

-(NSView *)outlineView:(NSOutlineView *)outlineView
    viewForTableColumn:(NSTableColumn *)tableColumn
                  item:(SidePaneItem *)item
{
    NSView *view;
    if (item.isHeader)
    {
        // header
        view = [_sidePaneView makeViewWithIdentifier:@"SidePaneHeaderView" owner:self];
        [[(SidePaneHeaderView *)view label] setStringValue:item.title];
    }
    else if (item.isSmardIDItem)
    {
        // child
        view = [_sidePaneView makeViewWithIdentifier:@"SidePaneItemView" owner:self];
        [[(SidePaneItemView *)view label] setStringValue:item.title];
    }
    else if (item.isSearch)
    {
        // search
        view = [_sidePaneView makeViewWithIdentifier:@"SidePaneSearchView" owner:self];
        
        // set searchfield
        if (view.subviews.count == 1 && _searchField == nil)
        {
            _searchField = [view.subviews objectAtIndex:0];
            [searchPaneItem setSearchField:_searchField];
        }
    }
    return view;
}

-(BOOL)outlineView:(NSOutlineView *)outlineView
shouldShowOutlineCellForItem:(id)item
{
    return NO;
}

-(BOOL)outlineView:(NSOutlineView *)outlineView
  shouldExpandItem:(id)item
{
    return YES;
}

-(CGFloat)outlineView:(NSOutlineView *)outlineView
    heightOfRowByItem:(SidePaneItem *)item
{
    CGFloat height = 30;
    if (item.isHeader)
    {
        height = 45;
    }
    return height;
}

@end
