//
//  FlashButton.h
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlashButton : UIControl
@property (nonatomic, strong) UIImageView *flashButton;
@property (nonatomic, strong) UIImage *flashOnImage;
@property (nonatomic, strong) UIImage *flashOffImage;
@property BOOL flashIsOff;

- (void)flashIsPressed;
@end
