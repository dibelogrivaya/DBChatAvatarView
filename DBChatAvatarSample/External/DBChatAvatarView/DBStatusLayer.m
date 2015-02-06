//
//  DBStatusLayer.m
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 06/02/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBStatusLayer.h"

@implementation DBStatusLayer

- (id)init {
    self = [super init];
    
    if (self) {
        [self setup];
    }
    
    return self;
}

- (void)updateWithColor:(UIColor *)color {
    if (color == nil) {
        color = [UIColor whiteColor];
    }
    self.cornerRadius = CGRectGetWidth(self.frame) * .5f;
    self.backgroundColor = color.CGColor;
}

- (void)reset {
    self.hidden = YES;
    self.zPosition = 1;
}

- (void)setup {
    self.masksToBounds = YES;
    self.borderColor = [UIColor whiteColor].CGColor;
    self.borderWidth = 1.f;
    
    self.shouldRasterize = YES;
    self.rasterizationScale = [UIScreen mainScreen].scale;
    
    [self reset];
}

@end
