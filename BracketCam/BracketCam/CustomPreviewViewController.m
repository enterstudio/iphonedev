//
//  CustomPreviewViewController.m
//  BracketCam
//
//  Created by мишаня on 7/16/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "CustomPreviewViewController.h"
#import "CustomPreviewPicker.h"

@implementation CustomPreviewViewController
@synthesize preview=_preview;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    self.preview = [[CustomPreviewPicker alloc] init];
//    self.camera.CCPDelegate = self;
    
//    [self setupCameraLayout];
    
    [self presentViewController:self.preview animated:YES completion:nil];
    
//    [self becomeFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
