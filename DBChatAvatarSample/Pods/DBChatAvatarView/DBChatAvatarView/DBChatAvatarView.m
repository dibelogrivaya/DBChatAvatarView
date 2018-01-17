//
//  DBChatAvatarView.m
//
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChatAvatarView.h"

#import "DBStatusView.h"
#import "DBAvatarView.h"

#import "UIColor+Hex.h"

static const NSInteger kMaxVisibleAvatar = 4;

@interface DBChatAvatarView ()

@property (assign, nonatomic) NSInteger totalCount;

@property (strong, nonatomic) NSArray *statusViews;
@property (strong, nonatomic) NSArray *avatarViews;

@end

@implementation DBChatAvatarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self baseInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self baseInit];
    }
    return self;
}

- (void)baseInit {
    self.backgroundColor = [UIColor clearColor];
    
    self.avatarViews = @[];
    for (int i = 0; i < 4; i++) {
        DBAvatarView *avatarView = [[DBAvatarView alloc] init];
        [self addSubview:avatarView];
        self.avatarViews = [self.avatarViews arrayByAddingObject:avatarView];
    }
    
    self.statusViews = @[];
    for (int i = 0; i < 4; i++) {
        DBStatusView *statusView = [[DBStatusView alloc] init];
        [self addSubview:statusView];
        self.statusViews = [self.statusViews arrayByAddingObject:statusView];
    }
    
    [self reset];
}

- (void)reset {
    self.totalCount = 0;
    
    for (DBAvatarView *avatarView in self.avatarViews) {
        [avatarView reset];
    }
    
    for (DBStatusView *statusView in self.statusViews) {
        [statusView reset];
    }
}
   
- (void)reloadAvatars {
    [self reset];
    
    NSInteger usersCount = [self.chatAvatarDataSource numberOfUsersInChatAvatarView:self];
    self.totalCount = MIN(kMaxVisibleAvatar, usersCount);
    
    if (self.totalCount > 0) {
        CGFloat width = 0;
        CGSize size = self.frame.size;
        
        if (self.totalCount == 1) {
            width = floorf(size.width);
            [self updateAvatarViewAtIndex:0 withFrame:CGRectMake(0, 0, width, width)];
            return;
        }
        
        if (self.totalCount == 2) {
            width = floorf(size.width * 0.7);
            [self updateAvatarViewAtIndex:0 withFrame:CGRectMake(0, (size.height - width), width, width)];
            [self updateAvatarViewAtIndex:1 withFrame:CGRectMake((size.width - width), 0, width, width)];
            return;
        }
        
        if (self.totalCount == 3) {
            CGFloat kPadding = 1.f;
            width = floorf(size.width * 0.5) - kPadding * 2;
            [self updateAvatarViewAtIndex:0 withFrame:CGRectMake((size.width - width) * 0.5, 1.5, width, width)];
            [self updateAvatarViewAtIndex:1 withFrame:CGRectMake(kPadding, (size.height - width) - 1.5, width, width)];
            [self updateAvatarViewAtIndex:2 withFrame:CGRectMake((size.width - width), (size.height - width) - 1.5, width, width)];
            return;
        }
        
        CGFloat kPadding = 1.f;
        width = floorf(size.width * 0.5) - kPadding * 2;
        [self updateAvatarViewAtIndex:0 withFrame:CGRectMake(kPadding, kPadding, width, width)];
        [self updateAvatarViewAtIndex:1 withFrame:CGRectMake((size.width - width), kPadding, width, width)];
        [self updateAvatarViewAtIndex:2 withFrame:CGRectMake(kPadding, (size.height - width), width, width)];
        [self updateAvatarViewAtIndex:3 withFrame:CGRectMake((size.width - width), (size.height - width), width, width)];
    }
}

- (void)updateAvatarViewAtIndex:(NSInteger)index withFrame:(CGRect)frame {
    DBAvatarView *avatarView = self.avatarViews[index];
    avatarView.hidden = NO;
    avatarView.frame = frame;
    
    UIImage *image = [self.chatAvatarDataSource imageForAvatarAtIndex:index inChatAvatarView:self];
    [avatarView setImage:image];
    
    DBChatAvatarState state = [self.chatAvatarDataSource stateForAvatarAtIndex:index inChatAvatarView:self];
    DBStatusView *statusView = self.statusViews[index];
    statusView.borderScale = (float)1/self.totalCount;
    
    CGFloat kStatusViewSide = CGRectGetWidth(avatarView.frame) / 3.5;
    CGRect statusRect = CGRectMake(avatarView.frame.origin.x + avatarView.frame.size.width - kStatusViewSide, avatarView.frame.origin.y + avatarView.frame.size.height - kStatusViewSide - 1.f, kStatusViewSide, kStatusViewSide);
    statusView.frame = statusRect;
    statusView.hidden = NO;
    [statusView setStatusColor:[self statusColorForState:state]];
}

- (UIColor *)statusColorForState:(DBChatAvatarState)state {
    switch (state) {
        case DBChatAvatarStateOffline: return [UIColor colorWithHex:0xE46663];
        case DBChatAvatarStateOnline: return [UIColor colorWithHex:0x91D66E];
        case DBChatAvatarStateNone: return nil;
        default: return nil;
    }
}

@end
