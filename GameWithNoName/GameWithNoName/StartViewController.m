//
//  StartViewController.m
//  GameWithNoName
//
//  Created by mike.tihonchik on 11/15/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "StartViewController.h"

@interface StartViewController ()

@property (strong, nonatomic) UIButton *startButton;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *gameLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gwnn.png"]];
    gameLabel.frame = CGRectMake(75, 50, self.view.frame.size.width, 30.0);
    [self.view addSubview:gameLabel];
    
    _startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _startButton.frame = CGRectMake(100, 240.0, 160.0, 40.0);
    [_startButton addTarget:self action:@selector(startGame:) forControlEvents:UIControlEventTouchDown];
    [_startButton setBackgroundImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];
    [self.view addSubview:_startButton];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startGame:(UIButton*)button {

}

@end
