//
//  TextualToggableButton.m
//  Ampz
//
//  Created by Maximilian Täschner on 20/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "TextualToggableButton.h"

@implementation TextualToggableButton

-(BOOL)isEnabled {
    return [super isEnabled];
}

-(void)setLiked:(BOOL)liked {
    self.title = liked ? self.onStateText : self.offStateText;
    [super setLiked:liked];
}

-(NSColor *)textColor {
    return [NSColor whiteColor];
}

-(void)setTitle:(NSString *)title {
    NSMutableAttributedString *attrTitle;
    attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    
    //
    // Color
    //
    if ([self textColor])
    {
        [attrTitle addAttribute:NSForegroundColorAttributeName value:[self textColor] range:range];
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
    
    //
    // calculate button size
    //
    [super setAttributedTitle:attrTitle];
    [self sizeToFit];
}

- (void)drawRect:(NSRect)dirtyRect {
    NSBezierPath* rectanglePath = [NSBezierPath bezierPathWithRoundedRect: NSMakeRect(NSMinX(dirtyRect) + floor(NSWidth(dirtyRect) * 0.00000 + 0.5), NSMinY(dirtyRect) + floor(NSHeight(dirtyRect) * 0.00000 + 0.5), floor(NSWidth(dirtyRect) * 1.00000 + 0.5) - floor(NSWidth(dirtyRect) * 0.00000 + 0.5), floor(NSHeight(dirtyRect) * 1.00000 + 0.5) - floor(NSHeight(dirtyRect) * 0.00000 + 0.5)) xRadius: 2 yRadius: 2];
    [[self color] setFill];
    [rectanglePath fill];
    [super drawRect:dirtyRect];
}



@end
