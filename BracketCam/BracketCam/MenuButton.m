//
//  MenuButton.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		UIImageView *buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 64, 64)];
		buttonImage.image = [UIImage imageNamed:@"Tools.png"];
		[self addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
		[self addSubview:buttonImage];
	}
	return self;
}

- (void)buttonPressed {
	// TODO: Could toggle a button state and/or image
}

@end
