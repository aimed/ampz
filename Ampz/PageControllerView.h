//
//  PageControllerView.h
//  Ampz
//
//  Created by Maximilian Täschner on 19/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BorderedBackgroundView.h"

@protocol SwipeGestureRecognizerDelegate <NSObject>
-(void)backwards;
-(void)forwards;
@end

@interface PageControllerView : BorderedBackgroundView
@property (nonatomic, weak) IBOutlet id<SwipeGestureRecognizerDelegate> delegate;
@end
