//
//  CustomCameraViewController.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "CustomCameraViewController.h"
#import "OverlayView.h"

@implementation CustomCameraViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    self.camera = [[CustomCameraPicker alloc] init];
    [self.camera.view setBackgroundColor:[UIColor clearColor]];
    //self.camera.CCPDelegate = self;

    OverlayView *overlayView = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGTH)];
    [self.camera setCameraOverlayView:overlayView];
    
    [self presentModalViewController:self.camera animated:YES];
    
    [self becomeFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)cameraStartPicture
{
}

- (void)cameraStopPicture:(UIImage *)photoTaken
{
}

-(void)takePictureOnButtonPressed
{
    NSLog(@"take picture");
	[self.camera takePicture];
}

@end
