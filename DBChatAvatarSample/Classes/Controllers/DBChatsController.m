//
//  DBChatsController.m
//  DBChatAvatarSample
//
//  Created by Diana Belogrivaya on 31/01/2015.
//  Copyright (c) 2015 Diana Belogrivaya. All rights reserved.
//

#import "DBChatsController.h"

#import "DBChatCell.h"
#import "DBChatManager.h"

@interface DBChatsController ()

@property (strong, nonatomic) NSArray *chats;

@end

@implementation DBChatsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.chats = [[DBChatManager instance] sampleChats];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.chats count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBChatCell *cell = (DBChatCell *)[tableView dequeueReusableCellWithIdentifier:[DBChatCell cellID] forIndexPath:indexPath];
    
    DBChat *chat = self.chats[indexPath.row];
    [cell setChat:chat];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DBChatCell cellHeight];
}

@end
