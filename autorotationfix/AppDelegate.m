//
//  AppDelegate.m
//  autorotationfix
//
//  Created by John DiSalvo on 10/31/12.
//  Copyright (c) 2012 DiSalvo Technologies, LLC. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "CustomNavigationController.h"
#import "SecondViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // set initial view
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        
    viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    navigationController = [[CustomNavigationController alloc]
                            initWithRootViewController:viewController]; // iOS 6 autorotation fix
    [navigationController setNavigationBarHidden:YES animated:NO];
    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self.window setRootViewController:navigationController]; // iOS 6 autorotation fix
    //[self.window addSubview:navigationController.view];
    
    [self.window makeKeyAndVisible];
    
    
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

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window  // iOS 6 autorotation fix
{
    if ([navigationController.topViewController isKindOfClass:[SecondViewController class]])
    {
        return  UIInterfaceOrientationMaskLandscapeLeft;
        
    }
    else {
        return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeRight;
        
    }
    
}

@end
