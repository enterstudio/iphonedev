//
//  NewsEntry.h
//  Dinamo Riga
//
//  Created by mike.tihonchik on 9/23/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsEntry : NSObject

@property (nonatomic, assign) NSString *blogTitle;
@property (nonatomic, assign) NSString *articleTitle;
@property (nonatomic, assign) NSString *articleUrl;
@property (nonatomic, assign) NSDate *articleDate;

- (id)initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleUrl:(NSString*)articleUrl articleDate:(NSDate*)articleDate;

@end
