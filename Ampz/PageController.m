//
//  PageController.m
//  Ampz
//
//  Created by Maximilian Täschner on 05/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "PageController.h"
#import "NSMutableArray+RemoveObjectsAfterIndex.h"
#import "AmpzNotificationCentral.h"
#import "MixListController.h"
#import "SettingsController.h"
#import "ETMix.h"
#import "ETUser.h"
#import "ETSmartID.h"
#import "SidePaneController.h"
#import "MixDetailsController.h"
#import "UserController.h"

@interface PageController ()
-(void)setActiveViewControllerWithIndex:(NSUInteger)index;
-(void)setContent:(NSView *)view;
-(NSString *)identifierForRepresentedObject:(id)object;
-(NSViewController<PageItemController> *)viewControllerForIdentifier:(NSString *)identifier;
@end

@implementation PageController {
    NSMutableArray *_pageItems;
    CGFloat _currentIndex;
    NSMutableDictionary *_viewControllers;
}

-(void)viewDidLoad {
    //
    // initialize page items
    //
    _viewControllers = [NSMutableDictionary new];
    _pageItems = [NSMutableArray new];
    _currentIndex = 0;
    
    //
    // prepare subviews
    //
    [_contentView setAutoresizesSubviews:YES];
    
    //
    // listen for navigation notifications
    //
    [[AmpzNotificationCentral defaultCenter]
     addObserver:self
     selector:@selector(notificationProxy:)
     name:AmpzNotificationNavigate
     object:nil];
}

-(void)dealloc {
    [[AmpzNotificationCentral defaultCenter] removeObserver:self];
}

-(void)notificationProxy:(NSNotification *)aNotification {
    id representedObject = aNotification.object;
    
    // add to history
    PageItem *pageItem = [PageItem pageItemWithRepresentedObject:representedObject];
    
    // remove descending page items
    [_pageItems removeObjectsAfterIndex:_currentIndex];
    [_pageItems addObject:pageItem];
    
    // set new page item
    [self setActiveViewControllerWithIndex:_pageItems.count - 1];
    
    // prepare with object
    // set content
    
    /*
    // clear selected item at sidepanel
    //
    [[NSNotificationCenter defaultCenter]
     postNotificationName:kSidePaneShouldClearSelected
     object:nil];
     */
}

-(void)setActiveViewControllerWithIndex:(NSUInteger)index {
    if (index >= _pageItems.count) {
        return;
    }
    
    _currentIndex = index;
    
    NSViewController<PageItemController> *viewController;
    PageItem *pageItem = [_pageItems objectAtIndex:index];
    NSString *identifier = [self identifierForRepresentedObject:pageItem.representedObject];

    // create new viewcontroller
    if (![_viewControllers objectForKey:identifier])
    {
        viewController = [self viewControllerForIdentifier:identifier];
        [_viewControllers setObject:viewController forKey:identifier];
    }
    
    if (!viewController)
    {
        viewController = [_viewControllers objectForKey:identifier];
    }
    
    // call viewcontroller
    if (pageItem.data)
    {
        [viewController representPageItemWithData:pageItem];
    }
    else
    {
        [viewController representPageItemEmpty:pageItem];
    }
    
    [self setContent:viewController.view];
}



#pragma mark PageController

-(void)backwards {
    [self setActiveViewControllerWithIndex:_currentIndex - 1];
}

-(void)forwards {
    [self setActiveViewControllerWithIndex:_currentIndex + 1];
}

-(NSString *)identifierForRepresentedObject:(id)object {
    if ([object isKindOfClass:[ETSmartID class]]) {
        return @"mixList";
    }
    if ([object isKindOfClass:[ETMix class]])
    {
        return @"mix";
    }
    if ([object isKindOfClass:[ETUser class]])
    {
        return @"user";
    }
    if ([object isEqualTo:AmpzNavigationTargetSettings])
    {
        return @"settings";
    }
    return nil;
}

-(NSViewController<PageItemController> *)viewControllerForIdentifier:(NSString *)identifier {
    if ([identifier isEqualToString:@"mixList"]) {
        return [self.storyboard instantiateControllerWithIdentifier:@"homeController"];
    }
    if ([identifier isEqualToString:@"mix"]) {
        return [MixDetailsController new];
    }
    if ([identifier isEqualToString:@"user"]) {
        return [UserController new];
    }
    if ([identifier isEqualToString:@"settings"]) {
        return [SettingsController new];
    }
    return nil;
}


-(void)setRepresentedObject:(id)representedObject {
    NSLog(@"Don't use this!");
    [super setRepresentedObject:representedObject];
}

-(void)setContent:(NSView *)view {
    view.frame = _contentView.bounds;
    view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    [_contentView setSubviews:@[view]];
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [_contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
}
@end
