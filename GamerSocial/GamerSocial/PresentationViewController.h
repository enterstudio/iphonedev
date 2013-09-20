//
//  PresentationViewController.h
//  GamerSocial
//
//  Created by mike.tihonchik on 9/20/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PresentationViewControllerDelegate <NSObject>

@optional
- (void)slideMenuToSide;

@required
- (void)slideMenuOrigin;

@end

@interface PresentationViewController : UIViewController

@property (nonatomic, assign) id<PresentationViewControllerDelegate> delegate;

@end
