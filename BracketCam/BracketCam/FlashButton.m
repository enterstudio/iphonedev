//
//  FlashButton.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "FlashButton.h"

@implementation FlashButton
@synthesize flashIsOff=_flashIsOff;
@synthesize flashButton=_flashButton;
@synthesize flashOffImage=_flashOffImage;
@synthesize flashOnImage=_flashOnImage;

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		_flashButton = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
        _flashOffImage = [UIImage imageNamed:@"Brightness Mesure.png"];
        _flashOnImage = [UIImage imageNamed:@"Brightness Mesure.png"];
        _flashButton.image = _flashOffImage;
        _flashIsOff = YES;
		[self addTarget:self action:@selector(flashIsPressed) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:_flashButton];
	}
	return self;
}

- (void)flashIsPressed {
	if( _flashIsOff == YES)
    {
        _flashIsOff = NO;
        _flashButton.image = _flashOnImage;
    }
    else
    {
        _flashIsOff = YES;
        _flashButton.image = _flashOffImage;
    }
}

@end
