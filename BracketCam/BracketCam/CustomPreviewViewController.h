//
//  CustomPreviewViewController.h
//  BracketCam
//
//  Created by мишаня on 7/16/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPreviewPicker.h"

@protocol CustomPreviewDelegate <NSObject>
@end

@interface CustomPreviewViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    CustomPreviewPicker *_preview;
}

@property (nonatomic, strong) CustomPreviewPicker *preview;
@property (nonatomic, assign) id<CustomPreviewDelegate>delegate;
@end
