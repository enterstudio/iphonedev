//
//  XBoxAPI.h
//  GamerSocial
//
//  Created by mike.tihonchik on 9/20/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XBoxAPIDelegate <NSObject>

@optional
- (void)setUserData:(NSString *) gamerTag;

@end

@interface XBoxAPI : NSObject

@property (nonatomic, assign) id<XBoxAPIDelegate> delegate;

- (BOOL)getUserInfo:(NSString *) gameTag;

@end
