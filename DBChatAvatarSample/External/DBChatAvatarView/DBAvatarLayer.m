//
//  DBAvatarLayer.m
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBAvatarLayer.h"

#import "UIColor+HEX.h"
#import "UIImage+Default.h"

@implementation DBAvatarLayer

- (id)init {
    self = [super init];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image {
    [self updateContentWithImage:image];
    
    self.cornerRadius = CGRectGetWidth(self.frame) * .5f;
}

- (void)setImageWithURLString:(NSString *)stringUrl {
    if (self.contents == nil) {
        [self updateContentWithImage:nil];
    }
    
    self.cornerRadius = CGRectGetWidth(self.frame) * .5f;
    
    [self downloadImageWithUrlString:stringUrl];
}

- (void)updateContentWithImage:(UIImage *)image {
    if (image == nil) {
        image = [UIImage defaultUserPlaceholder];
    }
    self.contents = (id)(image).CGImage;
}

- (void)reset {
    self.hidden = YES;
    self.zPosition = 0;
}

- (void)setup {
    self.masksToBounds = YES;
    self.borderWidth = 1.f;
    self.borderColor = [UIColor colorWithWhite:.7f alpha:.9f].CGColor;
    
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
    
    [self reset];
}

#pragma mark - Download

- (void)downloadImageWithUrlString:(NSString *)urlString {
    if (urlString == nil) {
        return;
    }
#warning Implement downloading image
    
}

//- (void)drawRect:(CGRect)rect {
//    CGFloat kMainBorderWidth = 1.f;
//    CGRect imageRect = CGRectMake((kMainBorderWidth), (kMainBorderWidth) , rect.size.width - (kMainBorderWidth * 2), rect.size.height - (kMainBorderWidth * 2));
//    CGFloat kStatusViewSide = imageRect.size.height / 4.f;
//    CGFloat kBorderWidth = kStatusViewSide / 10.f;
//    CGRect statusRect = CGRectMake(imageRect.origin.x + imageRect.size.width - kStatusViewSide - kBorderWidth, imageRect.origin.y + imageRect.size.height - kStatusViewSide - kBorderWidth, kStatusViewSide, kStatusViewSide);
//    
////    CGColorSpaceRef maskColorSpaceRef = CGColorSpaceCreateDeviceGray();
////    CGContextRef mainMaskContextRef = CGBitmapContextCreate(NULL, rect.size.width, rect.size.height, 8, rect.size.width, maskColorSpaceRef, 0);
////    CGColorSpaceRelease(maskColorSpaceRef);
////    
////    CGContextSetFillColorWithColor(mainMaskContextRef, [UIColor blackColor].CGColor);
////    CGContextFillRect(mainMaskContextRef, rect);
////    CGContextSetFillColorWithColor(mainMaskContextRef, [UIColor whiteColor].CGColor);
////    
////    CGContextMoveToPoint(mainMaskContextRef, 0, 0);
////    CGContextAddEllipseInRect(mainMaskContextRef, imageRect);
////    CGContextFillPath(mainMaskContextRef);
////      
////    CGImageRef mainMaskImageRef = CGBitmapContextCreateImage(mainMaskContextRef);
////    CGContextRelease(mainMaskContextRef);
//    
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(contextRef);
////    CGImageRef imageRef = CGImageCreateWithMask(_avatarImage.CGImage, mainMaskImageRef);
////    CGContextTranslateCTM(contextRef, 0, rect.size.height);
////    CGContextScaleCTM(contextRef, 1.0, -1.0);
////    CGContextSaveGState(contextRef);
////    CGContextDrawImage(contextRef, rect, imageRef);
////    CGContextRestoreGState(contextRef);
////    CGContextSaveGState(contextRef);
////    
////    CGImageRelease(mainMaskImageRef);
////    CGImageRelease(imageRef);
//    
////    CGContextRestoreGState(contextRef);
////    CGContextSetLineWidth(contextRef, kBorderWidth / 2);
////    CGContextSetStrokeColorWithColor(contextRef, [UIColor colorWithWhite:.7f alpha:.9f].CGColor);
////    CGContextMoveToPoint(contextRef, 0, 0);
////    CGContextAddEllipseInRect(contextRef, imageRect);
////    CGContextStrokePath(contextRef);
//
//    if (_avatarStateColor != nil) {
//        CGContextRestoreGState(contextRef);
//        CGContextSaveGState(contextRef);
//        CGContextSetFillColorWithColor(contextRef, _avatarStateColor.CGColor);
//        CGContextAddEllipseInRect(contextRef, statusRect);
//        CGContextFillPath(contextRef);
//        
//        CGContextRestoreGState(contextRef);
//        CGContextSaveGState(contextRef);
//        CGContextSetStrokeColorWithColor(contextRef, [UIColor whiteColor].CGColor);
//        CGContextSetLineWidth(contextRef, kBorderWidth);
//        CGContextMoveToPoint(contextRef, 0, 0);
//        CGContextAddEllipseInRect(contextRef, statusRect);
//    }
//    
//    CGContextStrokePath(contextRef);
//    CGContextRestoreGState(contextRef);
//}

@end
