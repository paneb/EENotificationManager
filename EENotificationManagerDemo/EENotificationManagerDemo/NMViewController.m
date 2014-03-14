//
//  NMViewController.m
//  EENotificationManagerDemo
//
//  Created by Francesco Cabras on 14/03/14.
//  Copyright (c) 2014 Francesco Cabras. All rights reserved.
//

#import "NMViewController.h"
#import "NMAppDelegate.h"
#import <EENotificationManager/EENotificationManager.h>

@interface NMViewController ()

@end

@implementation NMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doAction:(id)sender {
    [[EENotificationManager sharedInstance] sendNotification:NotificationOne withUserDict:nil andPostingStyle:NSPostNow];
}

@end
