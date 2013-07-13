//
//  CustomCameraViewController.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCameraPicker.h"

@protocol CustomCameraDelegate <NSObject>
- (void)customCameraDidCancelled;
@end

@interface CustomCameraViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, CustomCameraPickerDelegate>
{
    CustomCameraPicker *_camera;
}

@property (nonatomic, strong) CustomCameraPicker *camera;
@property (nonatomic, assign) id<CustomCameraDelegate>delegate;

-(void)takePictureOnButtonPressed;
-(void)singleTap:(UITouch*)touch;
@end
