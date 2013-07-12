//
//  CaptureButton.m
//  BracketCam
//
//  Created by мишаня on 7/11/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "CaptureButton.h"

@implementation CaptureButton

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		UIImageView *buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 77, 77)];
		buttonImage.image = [UIImage imageNamed:@"Camera 2.png"];
		[self addSubview:buttonImage];
	}
	return self;
}

@end
