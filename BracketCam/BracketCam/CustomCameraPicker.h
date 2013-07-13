//
//  CustomCameraPicker.h
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CAMERA_TRANSFORM_X 1
#define CAMERA_TRANSFORM_Y 1.24299

#define SCREEN_WIDTH  320
#define SCREEN_HEIGTH 480

@class CustomCameraPicker;

@protocol CustomCameraPickerDelegate <NSObject>
- (void)cameraStartPicture;
- (void)cameraStopPicture:(UIImage*)photoTaken;
@end

@interface CustomCameraPicker : UIImagePickerController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, assign) id<CustomCameraPickerDelegate>CCPDelegate;

- (void)calliOStakePicture;
@end
