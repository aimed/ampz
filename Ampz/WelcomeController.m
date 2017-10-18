//
//  WelcomeController.m
//  Ampz
//
//  Created by Maximilian Täschner on 12/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "WelcomeController.h"
#import "ETMix.h"

NSString *const kUserDefaultsKeyLastMix = @"LAST_MIX";

@interface WelcomeController ()
@end

@implementation WelcomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData *mixData = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsKeyLastMix];
    
    if (mixData) {
        ETMix *lastMix = [NSKeyedUnarchiver unarchiveObjectWithData:mixData];
        [_mixPlayButton setMix:lastMix];
    } else {
        [_mixPlayButton removeFromSuperview];
    }
}

@end
