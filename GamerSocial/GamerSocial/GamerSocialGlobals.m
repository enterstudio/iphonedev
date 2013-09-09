//
//  GamerSocialGlobals.m
//  GamerSocial
//
//  Created by mike.tihonchik on 9/9/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "GamerSocialGlobals.h"

@implementation GamerSocialGlobals

static GamerSocialGlobals *instance = nil;

#pragma mark - Lifecycle and Memory Management

+(GamerSocialGlobals *)sharedInstance
{
    @synchronized(self) {
        if(instance == nil)
            instance = [[super alloc] init];
    }
    return instance;
}

-(id)init {
    self = [super init];
    if(self) {
    }
    return self;
}

@end
