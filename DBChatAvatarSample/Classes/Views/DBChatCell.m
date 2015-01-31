//
//  DBChatCell.m
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChatCell.h"

#import "DBChat.h"
#import "DBChatAvatarView.h"

static NSString* const kCellIdentifier = @"CHAT_CELL_IDENTIFIER";
static const CGFloat kCellHeight = 70.f;

@interface DBChatCell ()

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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.lblName.numberOfLines = 3;
}

- (void)setChat:(DBChat *)chat {
    _chat = chat;
    
    self.lblName.text = _chat.name;
    [self.vwAvatarView updateWithUsers:_chat.users];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

@end
