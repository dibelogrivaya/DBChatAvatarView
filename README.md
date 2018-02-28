# DBChatAvatarView

The control, which allow you to create group avatar for chat.


[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?style=flat)](https://github.com/dibelogrivaya/DBChatAvatarView)
[![iOS](https://img.shields.io/badge/ios-%3E%3D8-orange.svg?style=flat)](https://github.com/dibelogrivaya/DBChatAvatarView)
[![Xcode](https://img.shields.io/badge/Xcode-9.0-blue.svg?style=flat)](https://developer.apple.com/xcode)
[![License](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat)](https://github.com/dibelogrivaya/DBChatAvatarView)

## Screenshot

![Sample screen](https://github.com/medinaonly/DBChatAvatarSample/blob/master/Screens/SampleScreen.png)


## Installation

```objc
source 'git@github.com:dibelogrivaya/db-specs.git'
pod "DBChatAvatarView" 
```

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

