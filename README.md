# DBChatAvatarSample

Sample for DBChatAvatarView - a control, which allow you to create group avatar for a chat.

## Screenshot

![Sample screen](https://github.com/medinaonly/DBChatAvatarSample/blob/master/Screens/SampleScreen.png)


## Installation

Pod 'DBChatAvatarView'

## Usage

* Import `DBChatAvatarView.h` in your view.
* Create a new `DBChatAvatarView` with Storyboards or via code.

```objc
DBChatAvatarView *chatAvatarView = [[DBChatAvatarView alloc] initWithFrame:frame];
[self.view addSubview:chatAvatarView];
```

* Implement protocol `DBChatAvatarViewDataSource`

```objc
@protocol DBChatAvatarViewDataSource <NSObject>

- (NSInteger)numberOfUsersInChatAvatarView:(DBChatAvatarView *)chatAvatarView;
- (DBChatAvatarState)stateForAvatarAtIndex:(NSInteger)avatarIndex inChatAvatarView:(DBChatAvatarView *)chatAvatarView;
- (UIImage *)imageForAvatarAtIndex:(NSInteger)avatarIndex inChatAvatarView:(DBChatAvatarView *)chatAvatarView;

@end

```

* Reload

```objc

[chatAvatarView reloadAvatars];

```

## Requirements

- iOS >= 8.0
- ARC

# License

DBChatAvatarSample is available under the MIT license. See the LICENSE file for more info.
