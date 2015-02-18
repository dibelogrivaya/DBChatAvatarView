//
//  DBStatusView.m
//
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBStatusView.h"

@implementation DBStatusView

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
    
    _statusColor = [UIColor whiteColor];
    _borderColor = [UIColor whiteColor];
    
    _borderWidth = 4.f;
    _hasStatus = NO;
    _borderScale = 1.f;

    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [self reset];
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self setNeedsDisplay];
}

- (void)setStatusColor:(UIColor *)statusColor {
    _statusColor = statusColor;
    [self setNeedsDisplay];
}

- (void)setHasStatus:(BOOL)hasStatus {
    _hasStatus = hasStatus;
    [self setNeedsDisplay];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}

- (void)setBorderScale:(CGFloat)borderScale {
    _borderScale = borderScale;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *ovalPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    [_statusColor setFill];
    [ovalPath fill];
    [ovalPath addClip];
    [_borderColor setStroke];
    ovalPath.lineWidth = _borderWidth * _borderScale;
    [ovalPath strokeWithBlendMode:kCGBlendModeNormal alpha:1.f];
}

@end
