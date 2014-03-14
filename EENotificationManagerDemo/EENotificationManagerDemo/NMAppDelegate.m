//
//  NMAppDelegate.m
//  EENotificationManagerDemo
//
//  Created by Francesco Cabras on 14/03/14.
//  Copyright (c) 2014 Francesco Cabras. All rights reserved.
//

#import "NMAppDelegate.h"

@implementation NMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[EENotificationManager sharedInstance] addNotificationObserver:self];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - EENotificationDelegate
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

@end
