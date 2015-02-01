//
//  DBChatAvatarView.h
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBChatAvatarView;

typedef NS_ENUM(NSInteger, DBChatAvatarState) {
    DBChatAvatarStateOffline,
    DBChatAvatarStateOnline
};
  
@protocol DBChatAvatarViewDataSource <NSObject>

- (NSInteger)numberOfUsersInChatAvatarView:(DBChatAvatarView *)chatAvatarView;
- (DBChatAvatarState)stateForAvatarAtIndex:(NSInteger)avatarIndex inChatAvatarUserView:(DBChatAvatarView *)chatAvatarView;
- (UIImage *)imageForAvatarAtIndex:(NSInteger)avatarIndex inChatAvatarUserView:(DBChatAvatarView *)chatAvatarView;

@end

@interface DBChatAvatarView : UIView

@property (weak, nonatomic) id <DBChatAvatarViewDataSource> chatAvatarDataSource;

- (void)reloadAvatars;

@end
