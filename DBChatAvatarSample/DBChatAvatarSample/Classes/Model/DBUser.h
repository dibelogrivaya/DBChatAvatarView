//
//  DBUser.h
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBUser : NSObject <NSCopying>

@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSString *avatar;
@property (assign, nonatomic, readonly) BOOL isOnline;

+ (instancetype)userWithName:(NSString *)userName avatar:(NSString *)userAvatarName onlineStatus:(BOOL)userOnline;

@end
