//
//  ViewController.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "ViewController.h"
#import "CustomCameraViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:70/255.f green:70/255.f blue:70/255.f alpha:1];
    
    UIButton *takeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [takeButton setTitle:@"take photo" forState:UIControlStateNormal];
    takeButton.frame = CGRectMake(60, 170, 200, 40);
    [self.view addSubview:takeButton];
    [takeButton addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];

    UIButton *previeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [previeButton setTitle:@"preview photo" forState:UIControlStateNormal];
    previeButton.frame = CGRectMake(60, 220, 200, 40);
    [self.view addSubview:previeButton];
    [previeButton addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];

}

- (void)takePhoto
{ 
    CustomCameraViewController *cameraController = [[CustomCameraViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:cameraController animated:YES completion:nil];
    cameraController.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)customCameraDidCancelled
{
    NSLog(@"Camera did cancel");
}

@end
