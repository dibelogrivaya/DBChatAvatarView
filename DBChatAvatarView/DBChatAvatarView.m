//
//  DBChatAvatarView.m
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChatAvatarView.h"

#import "DBAvatarView.h"

static const NSInteger kMaxVisibleAvatar = 4;

@interface DBChatAvatarView ()

@property (assign, nonatomic) NSInteger totalCount;

@property (strong, nonatomic) DBAvatarView *vwAvatar1;
@property (strong, nonatomic) DBAvatarView *vwAvatar2;
@property (strong, nonatomic) DBAvatarView *vwAvatar3;
@property (strong, nonatomic) DBAvatarView *vwAvatar4;

@end

@implementation DBChatAvatarView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self baseInit];
    }
    
    return self;
}

- (void)awakeFromNib {
    [self baseInit];
}

- (void)baseInit {
    self.totalCount = 0;
    self.backgroundColor = [UIColor clearColor];
    
    self.vwAvatar1 = [[DBAvatarView alloc] init];
    self.vwAvatar1.hidden = YES;
    [self addSubview:self.vwAvatar1];
    
    self.vwAvatar2 = [[DBAvatarView alloc] init];
    self.vwAvatar2.hidden = YES;
    [self addSubview:self.vwAvatar2];
    
    self.vwAvatar3 = [[DBAvatarView alloc] init];
    self.vwAvatar3.hidden = YES;
    [self addSubview:self.vwAvatar3];
    
    self.vwAvatar4 = [[DBAvatarView alloc] init];
    self.vwAvatar4.hidden = YES;
    [self addSubview:self.vwAvatar4];
}

- (void)updateWithUsers:(NSArray *)users {
    self.totalCount = MIN(kMaxVisibleAvatar, users.count);
    
    self.vwAvatar1.hidden = YES;
    self.vwAvatar2.hidden = YES;
    self.vwAvatar3.hidden = YES;
    self.vwAvatar4.hidden = YES;
    
    if (self.totalCount > 0) {
        CGFloat width = 0;
        CGSize size = self.frame.size;
        
        if (self.totalCount == 1) {
            width = floorf(size.width);
            
            self.vwAvatar1.user = users[0];
            self.vwAvatar1.hidden = NO;
            self.vwAvatar1.frame = CGRectMake(0, 0, width, width);
            [self.vwAvatar1 setNeedsDisplay];
            
            return;
        }
        
        if (self.totalCount == 2) {
            width = floorf(size.width * 0.7);
            
            self.vwAvatar1.user = users[0];
            self.vwAvatar1.hidden = NO;
            self.vwAvatar1.frame = CGRectMake(0, (size.height - width), width, width);
            [self.vwAvatar1 setNeedsDisplay];
            
            self.vwAvatar2.user = users[1];
            self.vwAvatar2.hidden = NO;
            self.vwAvatar2.frame = CGRectMake((size.width - width), 0, width, width);
            [self.vwAvatar2 setNeedsDisplay];
            
            return;
        }
        
        if (self.totalCount == 3) {
            width = floorf(size.width * 0.5);
            
            self.vwAvatar1.user = users[0];
            self.vwAvatar1.hidden = NO;
            self.vwAvatar1.frame = CGRectMake((size.width - width) * 0.5, 1.5, width, width);
            [self.vwAvatar1 setNeedsDisplay];
            
            self.vwAvatar2.user = users[1];
            self.vwAvatar2.hidden = NO;
            self.vwAvatar2.frame = CGRectMake(0, (size.height - width) - 1.5, width, width);
            [self.vwAvatar2 setNeedsDisplay];
            
            self.vwAvatar3.user = users[2];
            self.vwAvatar3.hidden = NO;
            self.vwAvatar3.frame = CGRectMake((size.width - width), (size.height - width) - 1.5, width, width);
            [self.vwAvatar3 setNeedsDisplay];
            
            return;
        }
        
        width = floorf(size.width * 0.5);
        
        self.vwAvatar1.user = users[0];
        self.vwAvatar1.hidden = NO;
        self.vwAvatar1.frame = CGRectMake(0, 0, width, width);
        [self.vwAvatar1 setNeedsDisplay];
        
        self.vwAvatar2.user = users[1];
        self.vwAvatar2.hidden = NO;
        self.vwAvatar2.frame = CGRectMake((size.width - width), 0, width, width);
        [self.vwAvatar2 setNeedsDisplay];
        
        self.vwAvatar3.user = users[2];
        self.vwAvatar3.hidden = NO;
        self.vwAvatar3.frame = CGRectMake(0, (size.height - width), width, width);
        [self.vwAvatar3 setNeedsDisplay];
        
        self.vwAvatar4.user = users[3];
        self.vwAvatar4.hidden = NO;
        self.vwAvatar4.frame = CGRectMake((size.width - width), (size.height - width), width, width);
        [self.vwAvatar4 setNeedsDisplay];
    }
}

@end
