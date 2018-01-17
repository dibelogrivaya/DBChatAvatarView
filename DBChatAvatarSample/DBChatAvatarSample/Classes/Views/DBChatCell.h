//
//  DBChatCell.h
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DBChat;

@interface DBChatCell : UITableViewCell

@property (strong, nonatomic) DBChat *chat;

+ (NSString *)cellID;
+ (CGFloat)cellHeight;

@end
