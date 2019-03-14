//
//  AppDelegate.m
//  Hypnonerd
//
//  Created by Tawhid Joarder on 3/14/19.
//  Copyright © 2019 Tawhid Joarder. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRHypnosisViewController.h"
#import "BNRReminderViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface AppDelegate ()

@end

@implementation AppDelegate
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler
{
    UNNotificationPresentationOptions present = UNNotificationPresentationOptionAlert + UNNotificationPresentationOptionSound;
    completionHandler(present);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //notification permission
    UNUserNotificationCenter *center =[UNUserNotificationCenter currentNotificationCenter];
    center.delegate=self;
    
    
    self.window = [ [ UIWindow alloc] initWithFrame:[ [ UIScreen mainScreen] bounds ] ];
    BNRHypnosisViewController *hvc = [ [ BNRHypnosisViewController alloc] init ] ;
    NSBundle *appBundle = [ NSBundle mainBundle] ;
    BNRReminderViewController *rvc = [ [ BNRReminderViewController alloc] initWithNibName:@"BNRReminderViewController" bundle:appBundle];
    UITabBarController *tabBar = [ [ UITabBarController alloc] init ] ;
    tabBar.viewControllers = @[ hvc , rvc ];
    self.window.rootViewController = tabBar ;
    self.window.backgroundColor = [ UIColor whiteColor] ;
    [self.window makeKeyAndVisible] ;
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
