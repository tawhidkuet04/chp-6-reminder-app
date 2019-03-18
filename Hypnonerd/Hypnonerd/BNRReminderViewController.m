//
//  BNRReminderViewController.m
//  Hypnonerd
//
//  Created by Tawhid Joarder on 3/14/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "BNRReminderViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface BNRReminderViewController ()
{
    
    BOOL isGrantedNotificationAccess;
}
@property (nonatomic,weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRReminderViewController
-(IBAction)addReminder:(id)sender{
    //// reminder setup local notificaiton method
    NSDate *date = self.datePicker.date;
   
    if(isGrantedNotificationAccess){
        if (@available(iOS 10.0, *)) {
            UNUserNotificationCenter *center=[UNUserNotificationCenter currentNotificationCenter];
            UNMutableNotificationContent * mucontent = [[UNMutableNotificationContent alloc]init];
            mucontent.title=@"Hypnonerd";
            mucontent.body=@"Hypnotize me!!!!!!";
            mucontent.sound=[UNNotificationSound defaultSound];
            NSDate *date = self.datePicker.date;
  
            NSDateComponents *triggerDate = [[NSCalendar currentCalendar]
                                             components:NSCalendarUnitYear +
                                             NSCalendarUnitMonth + NSCalendarUnitDay +
                                             NSCalendarUnitHour + NSCalendarUnitMinute +
                                             NSCalendarUnitSecond fromDate:date];
            UNCalendarNotificationTrigger *trigger = [ UNCalendarNotificationTrigger triggerWithDateMatchingComponents:triggerDate repeats:NO];

            UNNotificationRequest * request = [UNNotificationRequest requestWithIdentifier:@"UYLocalNotification" content:mucontent trigger:trigger];
            [center addNotificationRequest:request withCompletionHandler:nil];
            
            /// alert when press the button
            
            NSString *title = @"Reminder Set";
            NSString *msg = @"You just set up a reminder for Hypnonerd";
            NSString *oktext = @"OK" ;
            UIAlertController *alert = [ UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okButton = [ UIAlertAction actionWithTitle:oktext style:UIAlertActionStyleCancel handler:nil];
            [ alert addAction:okButton];
            [ self presentViewController:alert animated:YES completion:nil];
            
            
        } else {
            // Fallback on earlier versions
        }
    }
  
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePicker.minimumDate =[ NSDate dateWithTimeIntervalSinceNow:60];
    isGrantedNotificationAccess = false ;
    // Local Notificaiton permission
    UNUserNotificationCenter *center = [ UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound ;
    [ center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError *_Nullable error){
        isGrantedNotificationAccess = granted ;
    }
     ];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void) viewDidAppear:(BOOL)animated{
    //[super viewDidAppear:animated];
    

}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [ super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] ;
    if (self){
        self.tabBarItem.title = @"Reminder";
        UIImage *i = [ UIImage imageNamed:@"Time.png"];
        self.tabBarItem.image = i ;
    }
    return self ;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
