//
//  OverlayView.h
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCameraViewController.h"

@interface OverlayView : UIView
{
    CustomCameraViewController *_cameraController;
}

@property (nonatomic, strong) CustomCameraViewController *cameraController;

@end
