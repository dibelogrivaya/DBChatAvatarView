//
//  DBChatAvatarView.m
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChatAvatarView.h"

#import "UIColor+HEX.h"
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
   
- (void)reloadAvatars {
    NSInteger usersCount = [self.chatAvatarDataSource numberOfUsersInChatAvatarView:self];
    self.totalCount = MIN(kMaxVisibleAvatar, usersCount);
    
    self.vwAvatar1.hidden = YES;
    self.vwAvatar2.hidden = YES;
    self.vwAvatar3.hidden = YES;
    self.vwAvatar4.hidden = YES;
    
    if (self.totalCount > 0) {
        CGFloat width = 0;
        CGSize size = self.frame.size;
        
        if (self.totalCount == 1) {
            width = floorf(size.width);
            [self updateAvatarView:self.vwAvatar1 atIndex:0 withFrame:CGRectMake(0, 0, width, width)];
            return;
        }
        
        if (self.totalCount == 2) {
            width = floorf(size.width * 0.7);
            [self updateAvatarView:self.vwAvatar1 atIndex:0 withFrame:CGRectMake(0, (size.height - width), width, width)];
            [self updateAvatarView:self.vwAvatar2 atIndex:1 withFrame:CGRectMake((size.width - width), 0, width, width)];
            return;
        }
        
        if (self.totalCount == 3) {
            width = floorf(size.width * 0.5);
            [self updateAvatarView:self.vwAvatar1 atIndex:0 withFrame:CGRectMake((size.width - width) * 0.5, 1.5, width, width)];
            [self updateAvatarView:self.vwAvatar2 atIndex:1 withFrame:CGRectMake(0, (size.height - width) - 1.5, width, width)];
            [self updateAvatarView:self.vwAvatar3 atIndex:2 withFrame:CGRectMake((size.width - width), (size.height - width) - 1.5, width, width)];
            return;
        }
        
        width = floorf(size.width * 0.5);
        [self updateAvatarView:self.vwAvatar1 atIndex:0 withFrame:CGRectMake(0, 0, width, width)];
        [self updateAvatarView:self.vwAvatar2 atIndex:1 withFrame:CGRectMake((size.width - width), 0, width, width)];
        [self updateAvatarView:self.vwAvatar3 atIndex:2 withFrame:CGRectMake(0, (size.height - width), width, width)];
        [self updateAvatarView:self.vwAvatar4 atIndex:3 withFrame:CGRectMake((size.width - width), (size.height - width), width, width)];
    }
}

- (void)updateAvatarView:(DBAvatarView *)avatarView atIndex:(NSInteger)index withFrame:(CGRect)frame {
    DBChatAvatarState avatarState = [self.chatAvatarDataSource stateForAvatarAtIndex:index inChatAvatarView:self];
    avatarView.avatarStateColor = [self statusColorForState:avatarState];
    avatarView.avatarImage = [self.chatAvatarDataSource imageForAvatarAtIndex:index inChatAvatarView:self];
    avatarView.hidden = NO;
    avatarView.frame = frame;
    [avatarView setNeedsDisplay];
}

- (UIColor *)statusColorForState:(DBChatAvatarState)state {
    switch (state) {
        case DBChatAvatarStateOffline: return [UIColor colorWithRGB:0xE46663];
        case DBChatAvatarStateOnline: return [UIColor colorWithRGB:0x91D66E];
    }
}

@end
