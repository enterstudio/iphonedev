//
//  PresentationViewController.m
//  GamerSocial
//
//  Created by mike.tihonchik on 9/20/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "PresentationViewController.h"
#import "XBoxAPI.h"

@interface PresentationViewController () <XBoxAPIDelegate>

@end

@implementation PresentationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    XBoxAPI *xboxApi = [[XBoxAPI alloc] init];
    [xboxApi getUserInfo:@"mishanja"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setUserData:(NSString *)gamerTag {
    UILabel *gametagLabel = (UILabel *)[self.view viewWithTag:1];
    gametagLabel.text = gamerTag;
}

@end
