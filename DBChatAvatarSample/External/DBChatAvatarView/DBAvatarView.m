//
//  DBAvatarView.m
//
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBAvatarView.h"

#import "UIColor+HEX.h"
#import "UIImage+Default.h"

@implementation DBAvatarView {
    UIImage *_image;
}

- (id)init {
    self = [super init];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)reset {
    self.hidden = YES;
}

- (void)setup {
    self.backgroundColor = [UIColor clearColor];
    _borderColor = [UIColor colorWithWhite:.8f alpha:.8f];
    
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [self reset];
}

- (void)setImage:(UIImage *)image {
    if (image == nil) {
        _image = [UIImage defaultUserPlaceholder];
    } else {
        _image = image;
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGFloat kLineWidth = 1.f;
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    [[UIColor whiteColor] setFill];
    [ovalPath fill];
    [ovalPath addClip];
    [_image drawInRect:self.bounds];
    [_borderColor setStroke];
    ovalPath.lineWidth = kLineWidth;
    [ovalPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.f];
}

@end
