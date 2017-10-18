//
//  BlurredImageLayer.m
//  Ampz
//
//  Created by Maximilian Täschner on 09/03/15.
//  Copyright (c) 2015 NoRocketLab. All rights reserved.
//

#import "BlurredImageLayer.h"

@interface BlurredImageLayer ()
-(void)displayImage:(NSImage *)image;
@end

const float kBlurRadius = 10.0f;
@implementation BlurredImageLayer {
    CGImageRef cgImage;
    CIFilter *blurFilter;
}

+(instancetype)layerWithImageForURL:(NSURL *)url inLayer:(CALayer *)parent {
    BlurredImageLayer *layer = [self layer];
    [parent addSublayer:layer];
    [layer setZPosition:-1];
    
    // load image
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
     {
         if (connectionError || !data) {
             NSLog(@"Failed to load image: %@", connectionError);
             return;
         }
         
         NSImage *image = [[NSImage alloc] initWithData:data];
         [layer displayImage:image];
     }];
    
    return layer;
}

-(NSRect)coverSize {
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat h = CGImageGetHeight(cgImage);
    CGFloat w = CGImageGetWidth(cgImage);
    CGFloat lw = self.superlayer.frame.size.width;
    CGFloat lh = self.superlayer.frame.size.height;
    CGFloat fw = lw/w;
    CGFloat fh = lh/h;
    CGFloat factor = 1;
    if (fh > fw) {
        factor = fh;
    } else {
        factor = fw;
    }
    
    NSRect rect = NSMakeRect(x-kBlurRadius,
                             y-kBlurRadius,
                             factor*w + 2*kBlurRadius,
                             factor*h + 2*kBlurRadius);
    return rect;
}

-(void)displayImage:(NSImage *)image {
    NSGraphicsContext *context;
    context = [NSGraphicsContext currentContext];
    cgImage = [image CGImageForProposedRect:NULL
                                    context:context
                                      hints:nil];
    self.contents = (__bridge id)(cgImage);
    
    blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setDefaults];
    [blurFilter setValue:[NSNumber numberWithFloat:kBlurRadius] forKey:@"inputRadius"];
    [self setFilters:@[blurFilter]];
    
    // prepare layer
    self.layoutManager  = [CAConstraintLayoutManager layoutManager];
    self.autoresizingMask = kCALayerHeightSizable | kCALayerWidthSizable;
    self.contentsGravity = kCAGravityResizeAspectFill;
    
    self.frame = [self coverSize];
}
@end
