# DBChatAvatarSample

Sample for DBChatAvatarView - a control, which allow you to create group avatar for a chat.


![Sample screen](https://github.com/medinaonly/DBChatAvatarSample/blob/master/Screens/SampleScreen.png)


[Show on the CocoaControls](https://www.cocoacontrols.com/controls/dbchatavatarview)

## Installation

Copy files `DBChatAvatarView.h` and `DBAvatarView.m` into your project.

## Usage

Create a new DBChatAvatarView with Storyboards or via code.

```objc
DBChatAvatarView *chatAvatarView = [[DBChatAvatarView alloc] initWithFrame:frame];
[self.view addSubview:chatAvatarView];
```

Implement protocol `DBChatAvatarViewDataSource`

```objc
@protocol DBChatAvatarViewDataSource <NSObject>

- (NSInteger)numberOfUsersInChatAvatarView:(DBChatAvatarView *)chatAvatarView;
- (DBChatAvatarState)stateForAvatarAtIndex:(NSInteger)avatarIndex inChatAvatarUserView:(DBChatAvatarView *)chatAvatarView;
- (UIImage *)imageForAvatarAtIndex:(NSInteger)avatarIndex inChatAvatarUserView:(DBChatAvatarView *)chatAvatarView;

```

Reload

```objc

[chatAvatarView reloadAvatars];

```

## Requirements

- iOS >= 7.0
- ARC

# License

DBChatAvatarSample is available under the MIT license. See the LICENSE file for more info.
