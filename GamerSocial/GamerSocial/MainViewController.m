//
//  MainViewController.m
//  GamerSocial
//
<<<<<<< HEAD
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


=======
//  Created by mike.tihonchik on 9/20/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "MainViewController.h"
#import "PresentationViewController.h"
#import "SlideOutMenuController.h"

#define MAIN 1
#define MENU 2
#define SLIDE_TIMING .25
#define PANEL_WIDTH 60

@interface MainViewController() <UIGestureRecognizerDelegate, PresentationViewControllerDelegate>

@property (nonatomic, strong) PresentationViewController *presentationViewController;
@property (nonatomic, strong) SlideOutMenuController *slideOutMenuController;
@property (nonatomic, assign) CGPoint preVelocity;
@property (nonatomic, assign) BOOL showPanel;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeMainView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)initializeMainView {
	self.presentationViewController = [[PresentationViewController alloc] initWithNibName:@"PresentationViewController" bundle:nil];
	self.presentationViewController.view.tag = MAIN;
	self.presentationViewController.delegate = self;
	[self.view addSubview:self.presentationViewController.view];
	[self addChildViewController:_presentationViewController];
	[_presentationViewController didMoveToParentViewController:self];
	
	[self setupGestures];
}

-(void)initializeMenuView {
    self.slideOutMenuController = [[SlideOutMenuController alloc] initWithNibName:@"SlideOutMenuController" bundle:nil];
    self.slideOutMenuController.view.tag = MENU;
    [self.view addSubview:self.slideOutMenuController.view];
    [self addChildViewController:_slideOutMenuController];
    [_slideOutMenuController didMoveToParentViewController:self];
    _slideOutMenuController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)setupGestures {
	UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(showMenu:)];
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
    
	[_presentationViewController.view addGestureRecognizer:panRecognizer];
}

-(void)showMenu:(id)sender {
	[[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
    
	CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
	CGPoint velocity = [(UIPanGestureRecognizer*)sender velocityInView:[sender view]];
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        [self.view sendSubviewToBack:[self getMenu]];
        [[sender view] bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
	}
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        if (!_showPanel) {
            [self slideMenuOrigin];
        } else {
            [self slideMenuToSide];
        }
	}
    
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
        // are we more than halfway, if so, show the panel when done dragging by setting this value to YES
        _showPanel = abs([sender view].center.x - _presentationViewController.view.frame.size.width/2) > _presentationViewController.view.frame.size.width/2;
        
        // allow dragging only in x coordinates by only updating the x coordinate with translation position
        [sender view].center = CGPointMake([sender view].center.x + translatedPoint.x, [sender view].center.y);
        [(UIPanGestureRecognizer*)sender setTranslation:CGPointMake(0,0) inView:self.view];
        _preVelocity = velocity;
	}
}

-(UIView *)getMenu {
    if( _slideOutMenuController == nil) {
        [self initializeMenuView];
    }
    UIView *view = self.slideOutMenuController.view;
    return view;
}

-(void)slideMenuToSide {
    [self.view sendSubviewToBack:[self getMenu]];
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _presentationViewController.view.frame = CGRectMake(self.view.frame.size.width-PANEL_WIDTH, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         if (finished) {

                         }
                     }];
}

-(void)slideMenuOrigin {
	[UIView animateWithDuration:SLIDE_TIMING delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _presentationViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
                     completion:^(BOOL finished) {
                         if (finished) {
                             [self resetPresentationView];
                         }
                     }];
}

-(void)resetPresentationView {
	if (_slideOutMenuController != nil) {
		[self.slideOutMenuController.view removeFromSuperview];
		self.slideOutMenuController = nil;
	}
}

>>>>>>> 5a6d64ed9f2ef2f3f5390ddc0999e70a65c3c8bf
@end
