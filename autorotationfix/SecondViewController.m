//
//  SecondViewController.m
//  autorotationfix
//
//  Created by jdisalvo on 10/31/12.
//  Copyright (c) 2012 DiSalvo Technologies, LLC. All rights reserved.
//

#import "SecondViewController.h"
#import "TestView.h"

#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface SecondViewController ()

- (IBAction)onAlertTouched:(id)sender;
- (IBAction)onAddViewTouched:(id)sender;
@end

@implementation SecondViewController

- (IBAction)backButton:(id)sender
{
//    [self.navigationController popViewControllerAnimated:YES];
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    if (self.backBlock) {
        self.backBlock();
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (IS_IOS8) {
        [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:NO];
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationLandscapeRight] forKey:@"orientation"];
    }
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (IS_IOS8) {
        [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIDeviceOrientationPortrait] forKey:@"orientation"];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (BOOL)shouldAutorotate  // iOS 6 autorotation fix
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations // iOS 6 autorotation fix
{
    return UIInterfaceOrientationMaskLandscapeRight; // UIInterfaceOrientationMaskAll;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation // iOS 6 autorotation fix
{
    return UIInterfaceOrientationLandscapeRight; //UIInterfaceOrientationPortrait;
}


- (IBAction)onAlertTouched:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"test" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertView show];
}

- (IBAction)onAddViewTouched:(id)sender {
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"TestView" owner:nil options:nil];
    for (UIView *view in nibs) {
        if ([view isKindOfClass:[TestView class]]) {
            [self.view addSubview:view];
            CGPoint center = self.view.center;
            if (IS_IOS8) {
                view.center = center;
            }
            else {
                view.center = CGPointMake(center.y, center.x);
            }
            break;
        }
    }
}
@end
