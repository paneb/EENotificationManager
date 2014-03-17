# EENotificationManager

[![Version](http://cocoapod-badges.herokuapp.com/v/EENotificationManager/badge.png)](http://cocoadocs.org/docsets/EENotificationManager)
[![Platform](http://cocoapod-badges.herokuapp.com/p/EENotificationManager/badge.png)](http://cocoadocs.org/docsets/EENotificationManager)

## Demo

To run the example project; clone the repo, and run `pod install` from the EENotificationManagerDemo directory first.

## Usage

To use the library, declare a list of events:

```objc
enum DemoNotifications: NSInteger{
    NotificationOne = 1,
    NotificationTwo = 2,
    NotificationThree = 3,
    NotificationFour = 4
};
```

To send new notification:

```objc
    [[EENotificationManager sharedInstance] sendNotification:NotificationOne withUserDict:nil andPostingStyle:NSPostNow];
```

To register for notification:

```objc
    [[EENotificationManager sharedInstance] addNotificationObserver:self];
```

To unregister for notification:

```objc
    [[EENotificationManager sharedInstance] removeNotificationObserver:self];
```

To receive notification use the protocol: 
```objc
@protocol EENotificationProtocol <NSObject>

- (void)didReceiveNotification:(NSNotification *)notification;

@end
```

and implement the selector:
```objc
- (void)didReceiveNotification:(NSNotification *)notification
{
    NSDictionary *infoDict = notification.userInfo;
    enum DemoNotifications notificationType = [infoDict[@"state"] longValue];
    switch (notificationType) {
        case NotificationOne:
        {
            NSLog(@"In Notification One");
            [[EENotificationManager sharedInstance] sendNotification:NotificationThree withUserDict:nil andPostingStyle:NSPostNow];
            [[EENotificationManager sharedInstance] sendNotification:NotificationTwo withUserDict:nil andPostingStyle:NSPostNow];
            break;
        }
        case NotificationTwo:
        {
            NSLog(@"In Notification Two");
            break;
        }
        case NotificationThree:
        {
            NSLog(@"In Notification Three");
            [[EENotificationManager sharedInstance] sendNotification:NotificationFour withUserDict:nil andPostingStyle:NSPostNow];
            break;
        }
        case NotificationFour:
        {
            NSLog(@"In Notification Four");
            break;
        }
        default:
            break;
    }
}
```

## Installation

EENotificationManager is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

    pod "EENotificationManager"

## Author

Francesco Cabras, paneb.devel@gmail.com

## License

EENotificationManager is available under the MIT license. See the LICENSE file for more info.

