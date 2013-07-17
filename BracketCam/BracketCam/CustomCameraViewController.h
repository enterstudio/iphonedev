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
@property (nonatomic, strong) UIImageView *captureImage;
@property (nonatomic, strong) UIImageView *menuImage;
@property (nonatomic, strong) UIImageView *flashImage;
@property (nonatomic, strong) UIImageView *flipCameraImage;
@property (nonatomic, strong) UIImageView *cancelImage;

-(void)camptureImage:(UITouch*)touch;
-(void)setupCameraLayout;
-(void)changeFlashSetting;
-(void)changeCameraDevice;
@end
