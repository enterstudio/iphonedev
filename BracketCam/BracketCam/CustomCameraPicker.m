//
//  CustomCameraPicker.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "CustomCameraPicker.h"

@implementation CustomCameraPicker
@synthesize CCPDelegate=_CCPDelegate;

- (id)init
{
    if (self = [super init])
    {
        self.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
        self.cameraDevice = UIImagePickerControllerCameraDeviceRear;
        self.showsCameraControls = NO;
        self.navigationBarHidden = YES;
        self.toolbarHidden = YES;
        self.wantsFullScreenLayout = YES;
        self.cameraViewTransform = CGAffineTransformScale(self.cameraViewTransform, CAMERA_TRANSFORM_X, CAMERA_TRANSFORM_Y);
        self.delegate = self;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)calliOStakePicture
{
    NSLog(@"super picture...");
    [super takePicture];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"done taking picture...");
	UIImage *baseImage = [info objectForKey:UIImagePickerControllerOriginalImage];
	if (baseImage == nil) return;
	UIImageWriteToSavedPhotosAlbum(baseImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage*)image didFinishSavingWithError:(NSError *)error contextInfo:(NSDictionary*)info
{
    NSLog((@"failed to take picture... %@", error.description));
}

- (void)writeImageToDocuments:(UIImage*)image
{
    NSLog(@"write to disk...");
	NSData *png = UIImagePNGRepresentation(image);
    
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
    
	NSError *error = nil;
    [png writeToFile:[documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"image_%f.png",[[NSDate date] timeIntervalSince1970]]] options:NSAtomicWrite error:&error];
}

@end
