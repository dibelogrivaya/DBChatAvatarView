//
//  DBStatusView.h
//
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBStatusView : UIView

@property (nonatomic, assign) BOOL hasStatus;
@property (nonatomic) UIColor *statusColor;
@property (nonatomic) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat borderScale;

- (void)reset;

@end
