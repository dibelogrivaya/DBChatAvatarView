//
//  DBUser.m
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBUser.h"

@interface DBUser ()

@property (copy, nonatomic, readwrite) NSString *name;
@property (copy, nonatomic, readwrite) NSString *avatar;
@property (assign, nonatomic, readwrite) BOOL isOnline;

@end

@implementation DBUser

+ (instancetype)userWithName:(NSString *)userName avatar:(NSString *)userAvatarName onlineStatus:(BOOL)userOnline {
    return [[[self class] alloc] initWithName:userName avatar:userAvatarName onlineStatus:userOnline];
}

- (instancetype)initWithName:(NSString *)userName avatar:(NSString *)userAvatarName onlineStatus:(BOOL)userOnline {
    if (self = [super init]) {
        _name = userName;
        _avatar = userAvatarName;
        _isOnline = userOnline;
    }
    return self;
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] initWithName:_name avatar:_avatar onlineStatus:_isOnline];
}

@end
