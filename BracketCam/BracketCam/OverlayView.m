//
//  OverlayView.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "OverlayView.h"
#import "FlipCameraButton.h"
#import "FlashButton.h"
#import "MenuButton.h"
#import "CaptureButton.h"

@implementation OverlayView

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame]))
    {
		self.opaque = NO;
		self.backgroundColor = [UIColor clearColor];

        MenuButton *menuButton = [[MenuButton alloc] initWithFrame:CGRectMake(15, 25, 64, 64)];
        FlashButton *flashButton = [[FlashButton alloc] initWithFrame:CGRectMake(128, 25, 64, 64)];
        //FlipCameraButton *flipCameraButton = [[FlipCameraButton alloc] initWithFrame:CGRectMake(260, 25, 43, 32)];
        CaptureButton *captureButton = [[CaptureButton alloc] initWithFrame:CGRectMake(128, 390, 128, 128)];
        
		[captureButton addTarget:self action:@selector(captureImageAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
        [self addSubview:flashButton];
        [self addSubview:captureButton];
        
        self.cameraController = [[CustomCameraViewController alloc] init];
    }
    return self;
}

- (void)captureImageAction
{
    [self.cameraController takePictureOnButtonPressed];
}



@end
