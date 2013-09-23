//
//  NewsEntry.m
//  Dinamo Riga
//
//  Created by mike.tihonchik on 9/23/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "NewsEntry.h"

@implementation NewsEntry

@synthesize blogTitle=_blogTitle;
@synthesize articleTitle=_articleTitle;
@synthesize articleUrl=_articleUrl;
@synthesize articleDate=_articleDate;

- (id)initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleUrl:(NSString*)articleUrl articleDate:(NSDate*)articleDate {
    
    if ((self = [super init])) {
        _blogTitle = blogTitle;
        _articleTitle = articleTitle;
        _articleUrl = articleUrl;
        _articleDate = articleDate;
    }
    return self;
}

@end
