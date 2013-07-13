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
    
    UIImage *buttonImage = [UIImage imageNamed:@"start.png"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 128, 128);
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
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
