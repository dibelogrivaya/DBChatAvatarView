//
//  DBChatManager.m
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChatManager.h"

#import "DBChat.h"
#import "DBUser.h"

@implementation DBChatManager

+ (instancetype)instance {
    static id _sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [self new];
    });
    
    return _sharedClient;
}

- (NSArray *)sampleNames {
    static NSArray *names;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        names = @[
                  @"John Doe",
                  @"Jane Doe",
                  @"Tim Cook"
                  ];
    });
    
    return names;
}

- (NSArray *)sampleChatNames {
    static NSArray *chatNames;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        chatNames = @[
                      @"New York City Points of Interest",
                      @"World Health Organization",
                      @"African and Asian Elephants",
                      @"Computers"
                      ];
    });
    
    return chatNames;
}

- (NSArray *)sampleAvatars {
    static NSArray *avatars;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        avatars = @[
                      @"Avatar_1",
                      @"Avatar_2",
                      @"Avatar_3",
                      @"Avatar_4",
                      @"Avatar_5",
                      @""
                      ];
    });
    
    return avatars;
}

- (NSString *)randomChatName {
    NSArray *items = [self sampleChatNames];
    return items[arc4random_uniform((int32_t)[items count])];
}

- (NSString *)randomName {
    NSArray *items = [self sampleNames];
    return items[arc4random_uniform((int32_t)[items count])];
}

- (NSString *)randomAvatar {
    NSArray *items = [self sampleAvatars];
    return items[arc4random_uniform((int32_t)[items count])];
}

- (BOOL)randomStatus {
    return [@(arc4random_uniform(2)) boolValue];
}

- (NSArray *)sampleChats {
    static NSArray *chats;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        chats = [self randomChats];
    });
    
    return chats;
}

- (NSArray *)randomChats {
    NSMutableArray *chats = [NSMutableArray new];
    @autoreleasepool {
        NSInteger chatCount = 100;
        for (int i = 0; i < chatCount; i++) {
            NSInteger userCount = MAX(1, arc4random_uniform(5));
            NSMutableArray *users = [NSMutableArray new];
            for (int j = 0; j < userCount; j++) {
                DBUser *user = [DBUser userWithName:[self randomName] avatar:[self randomAvatar] onlineStatus:[self randomStatus]];
                [users addObject:user];
            }
            DBChat *chat = [DBChat chatWithName:[self randomChatName] users:users];
            [chats addObject:chat];
        }
    }
    return chats;
}

@end
