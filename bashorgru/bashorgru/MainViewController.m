//
//  MainViewController.m
//  bashorgru
//
//  Created by mike.tihonchik on 1/2/14.
//  Copyright (c) 2014 mike.tihonchik. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MainViewController.h"
#import "PresentationViewController.h"
#import "SlideOutMenuController.h"

#define HOME_TAG 1
#define MENU_PANEL_TAG 2
#define CORNER_RADIUS 4
#define SLIDE_TIMING .25
#define PANEL_WIDTH 60

@interface MainViewController () <PresentationViewControllerDelegate>

@property (nonatomic, strong) PresentationViewController *presentationViewController;
@property (nonatomic, strong) SlideOutMenuController *slideOutMenuController;
@property (nonatomic, assign) BOOL showMenu;

@end

@implementation MainViewController

#pragma mark -
#pragma mark View Did Load/Unload

-(void)viewDidLoad {
    [super viewDidLoad];
    [self setupPresentationController];
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
#pragma mark Setup View

-(void)setupPresentationController {
	self.presentationViewController = [[PresentationViewController alloc] initWithNibName:@"PresentationViewController" bundle:nil];
	self.presentationViewController.view.tag = HOME_TAG;
	self.presentationViewController.delegate = self;
	[self.view addSubview:self.presentationViewController.view];
	[self addChildViewController:_presentationViewController];
	[_presentationViewController didMoveToParentViewController:self];
	
//	[self setupGestures];
}

-(void)showPresentationViewWithShadow:(BOOL)value withOffset:(double)offset {
	if (value) {
		[_presentationViewController.view.layer setCornerRadius:CORNER_RADIUS];
		[_presentationViewController.view.layer setShadowColor:[UIColor blackColor].CGColor];
		[_presentationViewController.view.layer setShadowOpacity:0.8];
		[_presentationViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
        
	} else {
		[_presentationViewController.view.layer setCornerRadius:0.0f];
		[_presentationViewController.view.layer setShadowOffset:CGSizeMake(offset, offset)];
	}
}

-(void)resetPresentationView {
	if (_slideOutMenuController != nil) {
		[self.slideOutMenuController.view removeFromSuperview];
		self.slideOutMenuController = nil;
		_presentationViewController.leftButton.tag = 1;
		self.showMenu = NO;
	}
//	[self showCenterViewWithShadow:NO withOffset:0];
}

 
-(UIView *)getMenuView {
	// init view if it doesn't already exist
	if (_slideOutMenuController == nil)
	{
		// this is where you define the view for the left panel
		self.slideOutMenuController = [[SlideOutMenuController alloc] initWithNibName:@"SlideOutMenuController" bundle:nil];
		self.slideOutMenuController.view.tag = MENU_PANEL_TAG;
		self.slideOutMenuController.delegate = _presentationViewController;
        
		[self.view addSubview:self.slideOutMenuController.view];
        
		[self addChildViewController:_presentationViewController];
		[_slideOutMenuController didMoveToParentViewController:self];
        
		_slideOutMenuController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	}
    
	self.showMenu = YES;
    
	// setup view shadows
	[self showPresentationViewWithShadow:YES withOffset:-2];
    
	UIView *view = self.slideOutMenuController.view;
	return view;
}

/*
-(UIView *)getRightView {
	// init view if it doesn't already exist
	if (_rightPanelViewController == nil)
	{
		// this is where you define the view for the right panel
		self.rightPanelViewController = [[RightPanelViewController alloc] initWithNibName:@"RightPanelViewController" bundle:nil];
		self.rightPanelViewController.view.tag = RIGHT_PANEL_TAG;
		self.rightPanelViewController.delegate = _centerViewController;
		
		[self.view addSubview:self.rightPanelViewController.view];
		
		[self addChildViewController:self.rightPanelViewController];
		[_rightPanelViewController didMoveToParentViewController:self];
		
		_rightPanelViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	}
	self.showingRightPanel = YES;
    
	// setup view shadows
	[self showCenterViewWithShadow:YES withOffset:2];
    
	UIView *view = self.rightPanelViewController.view;
	return view;
}

#pragma mark -
#pragma mark Swipe Gesture Setup/Actions

#pragma mark - setup

-(void)setupGestures {
	UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(movePanel:)];
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
    
	[_centerViewController.view addGestureRecognizer:panRecognizer];
}

-(void)movePanel:(id)sender {
	[[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
    
	CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
	CGPoint velocity = [(UIPanGestureRecognizer*)sender velocityInView:[sender view]];
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        UIView *childView = nil;
        
        if(velocity.x > 0) {
            if (!_showingRightPanel) {
                childView = [self getLeftView];
            }
        } else {
            if (!_showingLeftPanel) {
                childView = [self getRightView];
            }
			
        }
        // make sure the view we're working with is front and center
        [self.view sendSubviewToBack:childView];
        [[sender view] bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
	}
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        
        if(velocity.x > 0) {
            // NSLog(@"gesture went right");
        } else {
            // NSLog(@"gesture went left");
        }
        
        if (!_showPanel) {
            [self movePanelToOriginalPosition];
        } else {
            if (_showingLeftPanel) {
                [self movePanelRight];
            }  else if (_showingRightPanel) {
                [self movePanelLeft];
            }
        }
	}
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
        if(velocity.x > 0) {
            // NSLog(@"gesture went right");
        } else {
            // NSLog(@"gesture went left");
        }
        
        // are we more than halfway, if so, show the panel when done dragging by setting this value to YES (1)
        _showPanel = abs([sender view].center.x - _centerViewController.view.frame.size.width/2) > _centerViewController.view.frame.size.width/2;
        
        // allow dragging only in x coordinates by only updating the x coordinate with translation position
        [sender view].center = CGPointMake([sender view].center.x + translatedPoint.x, [sender view].center.y);
        [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0,0) inView:self.view];
        
        // if you needed to check for a change in direction, you could use this code to do so
        if(velocity.x*_preVelocity.x + velocity.y*_preVelocity.y > 0) {
            // NSLog(@"same direction");
        } else {
            // NSLog(@"opposite direction");
        }
        
        _preVelocity = velocity;
	}
}

#pragma mark -
#pragma mark Delegate Actions

-(void)movePanelLeft {
	UIView *childView = [self getRightView];
	[self.view sendSubviewToBack:childView];
    
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
		 _centerViewController.view.frame = CGRectMake(-self.view.frame.size.width + PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
	 }
	 completion:^(BOOL finished) {
		 if (finished) {
			 
			 _centerViewController.rightButton.tag = 0;
		 }
	 }];
}

*/

-(void)showSlideOutMenu {
	UIView *childView = [self getMenuView];
	[self.view sendSubviewToBack:childView];
    
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
		 _presentationViewController.view.frame = CGRectMake(self.view.frame.size.width - PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
	 }
	 completion:^(BOOL finished) {
		 if (finished) {
			 _presentationViewController.leftButton.tag = 0;
		 }
	 }];
}

-(void)hideSlideOutMenu {
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
		 _presentationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
	 }
	 completion:^(BOOL finished) {
		 if (finished) {
			 [self resetPresentationView];
		 }
	 }];
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
