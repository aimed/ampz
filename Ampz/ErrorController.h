//
//  ErrorController.h
//  Ampz
//
//  Created by Maximilian Täschner on 13/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ErrorController : NSViewController

@property (weak) IBOutlet NSString *errorText;
@property (weak) IBOutlet NSButton *closeButton;
-(IBAction)close:(id)sender;

+(void)showError:(id)error;
+(void)showNotice:(id)notice;
+(void)hideNotice;

@end
