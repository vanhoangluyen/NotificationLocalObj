//
//  ViewController.m
//  NotificationLocalObj
//
//  Created by LuyenBG on 1/22/18.
//  Copyright © 2018 LuyenBG. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveAction:(id)sender {
    [self.textField resignFirstResponder];
    
    // Get the current date
    NSDate *pickerDate = [self.datePicker date];
    
    // Schedule the notification
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = pickerDate;
    localNotification.alertBody = self.textField.text;
    localNotification.alertAction = @"Show item";
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    // Request to reload table view data
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:nil];
    
    // Pop the view controller
    [self.navigationController popViewControllerAnimated:YES];
}


@end
