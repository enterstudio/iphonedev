//
//  CustomPreviewPicker.m
//  BracketCam
//
//  Created by мишаня on 7/16/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "CustomPreviewPicker.h"

@implementation CustomPreviewPicker

- (id)init
{
    if (self = [super init])
    {
        self.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.allowsEditing = NO;
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

@end
