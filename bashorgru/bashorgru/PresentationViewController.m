//
//  PresentationViewController.m
//  bashorgru
//
//  Created by mike.tihonchik on 1/2/14.
//  Copyright (c) 2014 mike.tihonchik. All rights reserved.
//

#import "PresentationViewController.h"

@interface PresentationViewController ()

@end

@implementation PresentationViewController

#pragma mark -
#pragma mark View Did Load/Unload

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

#pragma mark -
#pragma mark View Will/Did Appear

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

#pragma mark -
#pragma mark View Will/Did Disappear

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


#pragma mark -
#pragma mark Button Actions

-(IBAction)btnMovePanelRight:(id)sender {
	UIButton *button = sender;
	switch (button.tag) {
		case 0: {
			[_delegate hideSlideOutMenu];
			break;
		}
			
		case 1: {
			[_delegate showSlideOutMenu];
			break;
		}
			
		default:
			break;
	}
}

#pragma mark -
#pragma mark Default System Code

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end