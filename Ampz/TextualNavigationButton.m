//
//  NavigationButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 16/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "TextualNavigationButton.h"
#import "AmpzNotificationCentral.h"

@implementation TextualNavigationButton

+(void)initialize {
    [self exposeBinding:@"representedObject"];
}

-(void)awakeFromNib {
    if (self.target != self)
    {
        [self setTarget:self];
        [self setAction:@selector(onClick:)];
    }
}

-(void)setTitle:(NSString *)title {
    NSMutableAttributedString *attrTitle;
    attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    
    //
    // Color
    //
    if (_textColor)
    {
        [attrTitle addAttribute:NSForegroundColorAttributeName value:_textColor range:range];
    }
    
    //
    // Font
    //
    [attrTitle addAttribute:NSFontAttributeName value:self.font range:range];
    
    //
    // alignment
    //
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment = self.alignment;
    [attrTitle addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    
    //
    // apply
    //
    [attrTitle fixAttributesInRange:range];
    [super setAttributedTitle:attrTitle];
}

-(void)onClick:(id)sender {
    if (self.representedObject) {
        [AmpzNotificationCentral navigationNotification:self.representedObject];
    }
}

@end
