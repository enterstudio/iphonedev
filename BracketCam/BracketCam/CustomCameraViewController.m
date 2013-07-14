//
//  CustomCameraViewController.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "CustomCameraViewController.h"

@implementation CustomCameraViewController
@synthesize camera=_camera;
@synthesize captureImage=_captureImage;
@synthesize menuImage=_menuImage;
@synthesize flashImage=_flashImage;

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

    [self setupCameraLayout];
    
    [self presentViewController:self.camera animated:YES completion:nil];
    
    [self becomeFirstResponder];
}

- (void)setupCameraLayout
{
    UIView *overlayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    overlayView.opaque = NO;
    overlayView.alpha = 0.90f;
    
    _captureImage = [[UIImageView alloc] initWithFrame:CGRectMake(128, 390, 77, 77)];
    _captureImage.image = [UIImage imageNamed:@"Camera 2.png"];
    [_captureImage setUserInteractionEnabled:YES];
    [overlayView addSubview:_captureImage];

    _menuImage = [[UIImageView alloc] initWithFrame:CGRectMake(15, 25, 64, 64)];
    _menuImage.image = [UIImage imageNamed:@"Tools.png"];
    [_menuImage setUserInteractionEnabled:YES];
    [overlayView addSubview:_menuImage];

    _flashImage = [[UIImageView alloc] initWithFrame:CGRectMake(128, 25, 64, 64)];
    _flashImage.image = [UIImage imageNamed:@"Brightness Mesure.png"];
    [_flashImage setUserInteractionEnabled:YES];
    [overlayView addSubview:_flashImage];
    
    [self.camera setCameraOverlayView:overlayView];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    if( [touch tapCount] == 1)
    {
        if ([_captureImage pointInside: [self.view convertPoint:point toView: _captureImage] withEvent:event])
        {
            [self camptureImage:touch];
        }
        if ([_menuImage pointInside: [self.view convertPoint:point toView: _menuImage] withEvent:event])
        {
            // Go to menu
        }
        if ([_flashImage pointInside: [self.view convertPoint:point toView: _flashImage] withEvent:event])
        {
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	//UITouch *touch = [touches anyObject];
	//CGPoint currentTouchPosition = [touch locationInView:self.view];
}

-(void)camptureImage:(UITouch*)touch
{
	[self.camera takePicture];
}

/*
 * flash is OFF: 0
 * flash is ON:  1
 */
-(void)changeFlashSetting
{
    if ([self.camera cameraFlashMode] == 0)
    {
        [self.camera setCameraFlashMode:1];
        _flashImage.image = [UIImage imageNamed:@"Brightness Mesure On.png"];
    }
    else
    {
        [self.camera setCameraFlashMode:0];
        _flashImage.image = [UIImage imageNamed:@"Brightness Mesure.png"];
    }
}
@end
