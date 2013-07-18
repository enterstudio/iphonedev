//
//  CustomCameraViewController.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "CustomCameraViewController.h"
#import "ViewController.h"

@implementation CustomCameraViewController
@synthesize camera=_camera;
@synthesize captureImage=_captureImage;
@synthesize menuImage=_menuImage;
@synthesize flashImage=_flashImage;
@synthesize flipCameraImage=_flipCameraImage;
@synthesize cancelImage=_cancelImage;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
*/

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
    
    _captureImage = [[UIImageView alloc] initWithFrame:CGRectMake(122, 378, 77, 77)];
    _captureImage.image = [UIImage imageNamed:@"camera_capture.png"];
    [_captureImage setUserInteractionEnabled:YES];
//    UITapGestureRecognizer *captureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(captureImageTouch:)];
//    [_captureImage addGestureRecognizer:captureTap];
    [overlayView addSubview:_captureImage];

    _menuImage = [[UIImageView alloc] initWithFrame:CGRectMake(17, 25, 43, 32)];
    _menuImage.image = [UIImage imageNamed:@"camera_menu_button.png"];
    [_menuImage setUserInteractionEnabled:YES];
    [overlayView addSubview:_menuImage];

    _flashImage = [[UIImageView alloc] initWithFrame:CGRectMake(139, 25, 43, 32)];
    _flashImage.image = [UIImage imageNamed:@"camera_flash_off_button.png"];
    [_flashImage setUserInteractionEnabled:YES];
    [overlayView addSubview:_flashImage];
    
    _flipCameraImage = [[UIImageView alloc] initWithFrame:CGRectMake(260, 25, 43, 32)];
    _flipCameraImage.image = [UIImage imageNamed:@"camera_flip_button.png"];
    [_flipCameraImage setUserInteractionEnabled:YES];
    [overlayView addSubview:_flipCameraImage];
    
    _cancelImage = [[UIImageView alloc] initWithFrame:CGRectMake(21, 399, 32, 32)];
    _cancelImage.image = [UIImage imageNamed:@"camera_cancel_button.png"];
    [_cancelImage setUserInteractionEnabled:YES];
    [overlayView addSubview:_cancelImage];
    
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
        else if ([_menuImage pointInside: [self.view convertPoint:point toView: _menuImage] withEvent:event])
        {
            // Go to menu
        }
        else if ([_flashImage pointInside: [self.view convertPoint:point toView: _flashImage] withEvent:event])
        {
            [self changeFlashSetting];
        }
        else if ([_flipCameraImage pointInside: [self.view convertPoint:point toView: _flipCameraImage] withEvent:event])
        {
            [self changeCameraDevice];
        }
        else if ([_cancelImage pointInside: [self.view convertPoint:point toView: _cancelImage] withEvent:event])
        {
            NSLog(@"here cancel");
            for (UIViewController* uiViewController in self.navigationController.viewControllers) {
                if ([uiViewController isKindOfClass:[ViewController class]] ) {
                    ViewController *viewController = (ViewController*)uiViewController;
                    [self.navigationController popToViewController:viewController animated:YES];
                }
            }
//            [self.navigationController popToViewController:[arrayOfViewControllers objectAtIndex:3] animated:YES];
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
 * camera device REAR:  0
 * camera device FRONT: 1
 */
-(void)changeCameraDevice
{
    if ([self.camera cameraDevice] == 0)
    {
        [self.camera setCameraDevice:1];
    }
    else
    {
        [self.camera setCameraDevice:0];
    }
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
        _flashImage.image = [UIImage imageNamed:@"camera_flash_on_button.png"];
    }
    else
    {
        [self.camera setCameraFlashMode:0];
        _flashImage.image = [UIImage imageNamed:@"camera_flash_off_button.png"];
    }
}
@end
