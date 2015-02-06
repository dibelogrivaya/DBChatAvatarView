//
//  DBChatAvatarView.m
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChatAvatarView.h"

#import "UIColor+HEX.h"

#import "DBStatusLayer.h"
#import "DBAvatarLayer.h"

static const NSInteger kMaxVisibleAvatar = 4;

@interface DBChatAvatarView ()

@property (assign, nonatomic) NSInteger totalCount;

@property (strong, nonatomic) NSArray *statusLayers;
@property (strong, nonatomic) NSArray *avatarLayers;

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
    self.backgroundColor = [UIColor clearColor];
    
    self.avatarLayers = @[];
    for (int i = 0; i < 4; i++) {
        DBAvatarLayer *avatarLayer = [[DBAvatarLayer alloc] init];
        [self.layer addSublayer:avatarLayer];
        self.avatarLayers = [self.avatarLayers arrayByAddingObject:avatarLayer];
    }
    
    self.statusLayers = @[];
    for (int i = 0; i < 4; i++) {
        DBStatusLayer *statusLayer = [[DBStatusLayer alloc] init];
        [self.layer addSublayer:statusLayer];
        self.statusLayers = [self.statusLayers arrayByAddingObject:statusLayer];
    }
    
    [self reset];
}

- (void)reset {
    self.totalCount = 0;
    
    for (DBAvatarLayer *avatarLayer in self.avatarLayers) {
        [avatarLayer reset];
    }
    
    for (DBStatusLayer *statusLayer in self.statusLayers) {
        [statusLayer reset];
    }
}
   
- (void)reloadAvatars {
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
            [self updateAvatarViewAtIndex:0 withFrame:CGRectMake(0, (size.height - width), width, width) zPosition:1];
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
    [self updateAvatarViewAtIndex:index withFrame:frame zPosition:0.f];
}

- (void)updateAvatarViewAtIndex:(NSInteger)index withFrame:(CGRect)frame zPosition:(CGFloat)zPosition {
    DBAvatarLayer *avatarLayer = self.avatarLayers[index];
    avatarLayer.hidden = NO;
    avatarLayer.frame = frame;
    avatarLayer.zPosition = zPosition;
    
    id imageSource = [self.chatAvatarDataSource imageSourceForAvatarAtIndex:index inChatAvatarView:self];
    if ([imageSource isKindOfClass:[UIImage class]]) {
        [avatarLayer setImage:imageSource];
    } else if ([imageSource isKindOfClass:[NSString class]]) {
        [avatarLayer setImageWithURLString:imageSource];
    } else {
        [avatarLayer setImage:nil];
    }
    
    DBChatAvatarState state = [self.chatAvatarDataSource stateForAvatarAtIndex:index inChatAvatarView:self];
    DBStatusLayer *statusLayer = self.statusLayers[index];
    
    CGFloat kStatusViewSide = CGRectGetWidth(avatarLayer.frame) / 3.5;
    CGRect statusRect = CGRectMake(avatarLayer.frame.origin.x + avatarLayer.frame.size.width - kStatusViewSide - 1.f, avatarLayer.frame.origin.y + avatarLayer.frame.size.height - kStatusViewSide - 1.f, kStatusViewSide, kStatusViewSide);
    statusLayer.frame = statusRect;
    statusLayer.hidden = NO;
    [statusLayer updateWithColor:[self statusColorForState:state]];
}

- (UIColor *)statusColorForState:(DBChatAvatarState)state {
    switch (state) {
        case DBChatAvatarStateOffline: return [UIColor colorWithRGB:0xE46663];
        case DBChatAvatarStateOnline: return [UIColor colorWithRGB:0x91D66E];
        case DBChatAvatarStateNone: return nil;
    }
}

@end
