//
//  DBAvatarView.h
//
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBAvatarView : UIView

@property (nonatomic) UIColor *borderColor;

- (void)reset;
- (void)setImage:(UIImage *)image;

@end
