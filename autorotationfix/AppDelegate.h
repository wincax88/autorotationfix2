//
//  AppDelegate.h
//  autorotationfix
//
//  Created by John DiSalvo on 10/31/12.
//  Copyright (c) 2012 DiSalvo Technologies, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    UINavigationController *navigationController;
    ViewController *viewController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ViewController *viewController;

@end
