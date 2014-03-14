//
//  NMAppDelegate.h
//  EENotificationManagerDemo
//
//  Created by Francesco Cabras on 14/03/14.
//  Copyright (c) 2014 Francesco Cabras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EENotificationManager/EENotificationManager.h>

enum DemoNotifications: NSInteger{
    NotificationOne = 1,
    NotificationTwo = 2,
    NotificationThree = 3,
    NotificationFour = 4
};

@interface NMAppDelegate : UIResponder <UIApplicationDelegate, EENotificationProtocol>

@property (strong, nonatomic) UIWindow *window;

@end
