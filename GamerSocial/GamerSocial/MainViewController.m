//
//  MainViewController.m
//  GamerSocial
//
//  Created by мишаня on 9/10/13.
//  Copyright (c) 2013 mike tihonchik. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (void)setupView
{
    // setup center view
}

- (void)showCenterViewWithShadow:(BOOL)value withOffset:(double)offset
{
}

- (void)resetMainView
{
}

- (UIView *)getLeftView
{
    UIView *view = nil;
    return view;
}

- (void)setupGestures
{
}

-(void)movePanel:(id)sender
{
}

- (void)movePanelLeft // to show right panel
{
}

- (void)movePanelToOriginalPosition
{
}

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
