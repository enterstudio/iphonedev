//
//  FlipCameraButton.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "FlipCameraButton.h"

@implementation FlipCameraButton

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		UIImageView *buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 43, 32)];
		[self addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
		// TODO: Change opacity when being touched:
		[self addSubview:buttonImage];
	}
	return self;
}

- (void)buttonPressed {
	// TODO: Could toggle a button state and/or image
}

@end
