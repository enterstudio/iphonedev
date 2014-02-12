//
//  NavigationItem.h
//  bashorgru
//
//  Created by mike.tihonchik on 1/6/14.
//  Copyright (c) 2014 mike.tihonchik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NavigationItem : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *navName;
@property (weak, nonatomic) IBOutlet UIImageView *navImage;
@end
