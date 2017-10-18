//
//  ErrorController.m
//  Ampz
//
//  Created by Maximilian Täschner on 13/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "ErrorController.h"

NSString *const kErrorControllerErrorNotification = @"AMPZ_ERROR_NOTIFICATION";
NSString *const kErrorControllerNoticeNotification = @"AMPZ_NOTICE_NOTIFICATION";
NSString *const kErrorControllerHideNoticeNotification = @"AMPZ_HIDE_NOTICE_NOTIFICATION";
NSString *const kErrorControllerKeyErrorText = @"errorText";

@interface ErrorController ()

-(void)onError:(NSNotification *)aNotification;
-(void)onNotice:(NSNotification *)aNotification;
-(NSString *)stringForNotificationObject:(id)object;

@end

@implementation ErrorController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setHidden:YES];
    //
    // Subscribe to errors
    //
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(onError:)
     name:kErrorControllerErrorNotification
     object:nil];
    
    //
    // Subscribe to notices
    //
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(onNotice:)
     name:kErrorControllerNoticeNotification
     object:nil];
    
    //
    // Subscribe to hide Notifications
    //
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(close:)
     name:kErrorControllerHideNoticeNotification
     object:nil];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(NSString *)stringForNotificationObject:(id)object {
    NSString *string;
    if ([object isKindOfClass:[NSError class]])
    {
        NSError *error = object;
        string = error.localizedDescription;
    }
    else if (object == nil || object == NULL)
    {
        string = @"Some unknown error occured.";
    }
    else
    {
        string = [object description];
    }
    return string;
}

-(void)onError:(NSNotification *)aNotification {
    [self.view setHidden:NO];
    id item = aNotification.object;
    [self setValue:[self stringForNotificationObject:item] forKey:kErrorControllerKeyErrorText];
}

-(void)onNotice:(NSNotification *)aNotification {
    [self.view setHidden:NO];
    id item = aNotification.object;
    [self setValue:[self stringForNotificationObject:item] forKey:kErrorControllerKeyErrorText];
}

-(void)close:(id)sender {
    [self.view setHidden:YES];
}

+(void)showError:(id)error {
    [[NSNotificationCenter defaultCenter]
     postNotificationName:kErrorControllerErrorNotification
     object:error
     ];
}

+(void)showNotice:(id)notice {
    [[NSNotificationCenter defaultCenter]
     postNotificationName:kErrorControllerNoticeNotification
     object:notice];
}

+(void)hideNotice {
    [[NSNotificationCenter defaultCenter]
     postNotificationName:kErrorControllerNoticeNotification
     object:nil];
}

@end
