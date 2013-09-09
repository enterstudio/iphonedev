//
//  SlideOutMenuViewController.h
//  GamerSocial
//
//  Created by mike.tihonchik on 9/9/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideOutMenuViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *navData;
    NSArray *navImages;
}

@property (strong, nonatomic) IBOutlet UITableView *navTableView;
@property (nonatomic, strong) NSArray *navData;
@property (nonatomic, strong) NSArray *navImages;
@property (weak, nonatomic) IBOutlet UILabel *userFullName;
@property (weak, nonatomic) IBOutlet UITextView *userHeadline;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UIView *topView;

@end
