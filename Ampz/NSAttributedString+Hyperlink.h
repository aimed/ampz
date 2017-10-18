//
//  NSAttributedString+Hyperlink.h
//  Ampz
//
//  Created by Maximilian Täschner on 22/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface NSAttributedString (Hyperlink)
+(id)hyperlinkFromString:(NSString*)inString withURL:(NSURL*)aURL;
@end
