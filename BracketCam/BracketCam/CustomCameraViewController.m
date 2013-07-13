//
//  CustomCameraViewController.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "CustomCameraViewController.h"
#import "OverlayView.h"
#import "CaptureButton.h"

@implementation CustomCameraViewController
@synthesize camera=_camera;

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
    self.camera.CCPDelegate = self;

    //OverlayView *overlayView = [[OverlayView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGTH)];
    //[self.camera setCameraOverlayView:overlayView];
    
    UIImageView *buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(128, 390, 77, 77)];
    buttonImage.image = [UIImage imageNamed:@"Camera 2.png"];
    buttonImage.tag = 1;
    [buttonImage setUserInteractionEnabled:YES];
    [self.camera setCameraOverlayView:buttonImage];
    
    
    //CaptureButton *captureButton = [[CaptureButton alloc] initWithFrame:CGRectMake(128, 390, 128, 128)];
    //[captureButton addTarget:self action:@selector(singleTap:) forControlEvents:UIControlEventTouchUpInside];
    
    //[self.camera setCameraOverlayView:captureButton];
    
    [self presentViewController:self.camera animated:YES completion:nil];
    
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
	[self.camera calliOStakePicture];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
    int viewTag=[touch view].tag;
    NSLog(@"TAG: %di", viewTag);
    if ([touch tapCount] == 1 && [touch view].tag == 1) {
		[self singleTap:touch];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	//UITouch *touch = [touches anyObject];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	//UITouch *touch = [touches anyObject];
	//CGPoint currentTouchPosition = [touch locationInView:self.view];
}

-(void)singleTap:(UITouch*)touch
{
	NSLog(@"singleTap");
	[self.camera takePicture];
}

@end
