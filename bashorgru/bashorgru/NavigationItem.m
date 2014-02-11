//
//  NavigationItem.m
//  bashorgru
//
//  Created by mike.tihonchik on 1/6/14.
//  Copyright (c) 2014 mike.tihonchik. All rights reserved.
//

#import "NavigationItem.h"

@implementation NavigationItem

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
