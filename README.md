# DBChatAvatarView

The control, which allow you to create group avatar for chat.


[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20macOS-lightgrey.svg)](https://github.com/dibelogrivaya/DBChatAvatarView)
[![Xcode](https://img.shields.io/badge/Xcode-9.0-blue.svg)](https://developer.apple.com/xcode)
![Downloads Month](https://img.shields.io/cocoapods/dm/DBChatAvatarView.svg)
![Cocoapods](https://cocoapod-badges.herokuapp.com/v/HexColors/badge.png)

## Screenshot

![Sample screen](https://github.com/medinaonly/DBChatAvatarSample/blob/master/Screens/SampleScreen.png)


## Installation

```objc
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

## Requirements

- iOS >= 8.0
- ARC

# License

DBChatAvatarView is available under the MIT license. See the LICENSE file for more info.
