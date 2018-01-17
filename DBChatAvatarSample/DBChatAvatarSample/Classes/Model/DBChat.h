//
//  DBChat.h
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBChat : NSObject <NSCopying>

@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSArray *users;

+ (instancetype)chatWithName:(NSString *)chatName users:(NSArray *)chatUsers;

@end
