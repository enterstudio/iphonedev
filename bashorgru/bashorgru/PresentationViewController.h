//
//  PresentationViewController.h
//  bashorgru
//
//  Created by mike.tihonchik on 1/2/14.
//  Copyright (c) 2014 mike.tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideOutMenuController.h"

@protocol PresentationViewControllerDelegate <NSObject>

@optional
- (void)showSlideOutMenu;

@required
- (void)hideSlideOutMenu;

@end

@interface PresentationViewController : UIViewController <SlideOutMenuControllerDelegate>

@property (nonatomic, assign) id<PresentationViewControllerDelegate> delegate;
@property (nonatomic, weak) IBOutlet UIButton *leftButton;

@end
