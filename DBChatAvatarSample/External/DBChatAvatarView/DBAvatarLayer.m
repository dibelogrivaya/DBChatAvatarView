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

@end
