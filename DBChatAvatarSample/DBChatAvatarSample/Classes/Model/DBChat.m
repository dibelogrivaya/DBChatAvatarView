//
//  DBChat.m
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChat.h"

@interface DBChat ()

@property (copy, nonatomic, readwrite) NSString *name;
@property (copy, nonatomic, readwrite) NSArray *users;

@end

@implementation DBChat

+ (instancetype)chatWithName:(NSString *)chatName users:(NSArray *)chatUsers {
    return [[[self class] alloc] initWithName:chatName users:chatUsers];
}

- (instancetype)initWithName:(NSString *)chatName users:(NSArray *)chatUsers {
    if (self = [super init]) {
        _name = chatName;
        _users = chatUsers;
    }
    return self;
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] initWithName:_name users:_users];
}

@end
