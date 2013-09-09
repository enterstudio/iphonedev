//
//  AppDelegate.h
//  GamerSocial
//
//  Created by mike.tihonchik on 9/9/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideOutMenuViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    SlideOutMenuViewController *slideMenu;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SlideOutMenuViewController *slideMenu;

@end