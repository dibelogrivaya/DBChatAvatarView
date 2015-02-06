//
//  DBAvatarLayer.h
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBAvatarLayer : CALayer

- (void)reset;

- (void)setImage:(UIImage *)image;
- (void)setImageWithURLString:(NSString *)stringUrl;

@end
