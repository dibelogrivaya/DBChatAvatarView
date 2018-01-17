//
//  DBChatCell.m
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChatCell.h"

#import "DBChat.h"
#import "DBUser.h"
#import "UIImage+Default.h"

#import "DBChatAvatarView.h"

static NSString* const kCellIdentifier = @"CHAT_CELL_IDENTIFIER";
static const CGFloat kCellHeight = 70.f;

@interface DBChatCell () <DBChatAvatarViewDataSource>

@property (weak, nonatomic) IBOutlet DBChatAvatarView *vwAvatarView;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@end

@implementation DBChatCell

+ (NSString *)cellID {
    return kCellIdentifier;
}

+ (CGFloat)cellHeight {
    return kCellHeight;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.lblName.numberOfLines = 0;
    
    self.vwAvatarView.chatAvatarDataSource = self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    [self.vwAvatarView reset];
}

- (void)setChat:(DBChat *)chat {
    _chat = chat;
    
    self.lblName.text = _chat.name;
    [self.vwAvatarView reloadAvatars];
}

#pragma mark - DBChatAvatarViewDataSource

- (NSInteger)numberOfUsersInChatAvatarView:(DBChatAvatarView *)chatAvatarView {
    return _chat.users.count;
}

- (DBChatAvatarState)stateForAvatarAtIndex:(NSInteger)avatarIndex inChatAvatarView:(DBChatAvatarView *)chatAvatarView {
    DBUser *user = _chat.users[avatarIndex];
    return user.isOnline ? DBChatAvatarStateOnline : DBChatAvatarStateOffline;
}

- (UIImage *)imageForAvatarAtIndex:(NSInteger)avatarIndex inChatAvatarView:(DBChatAvatarView *)chatAvatarView {
    DBUser *user = _chat.users[avatarIndex];
    return (user.avatar && user.avatar.length > 0) ? [UIImage imageNamed:user.avatar] : [UIImage defaultUserPlaceholder];
}

@end
