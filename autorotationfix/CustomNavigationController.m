//
//  CustomNavigationController.m
//  autorotationfix
//
//  Created by John DiSalvo on 10/31/12.
//  Copyright (c) 2012 DiSalvo Technologies, LLC. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (BOOL)shouldAutorotate
{
    return NO; // self.topViewController.shouldAutorotate;
}
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;//self.topViewController.supportedInterfaceOrientations;
}


@end
