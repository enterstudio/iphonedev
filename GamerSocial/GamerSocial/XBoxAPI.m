//
//  XBoxAPI.m
//  GamerSocial
//
//  Created by mike.tihonchik on 9/20/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "XBoxAPI.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SBJson.h"
#import "PresentationViewController.h"

@interface XBoxAPI()

@property(nonatomic, strong) PresentationViewController *presentationViewController;

@end

@implementation XBoxAPI

- (BOOL)getUserInfo:(NSString *) gameTag {
    NSMutableString *baseUrl = [[NSMutableString init] initWithString:@"https://xboxapi.com/profile/"];
    [baseUrl appendString:gameTag];
    NSURL *url = [NSURL URLWithString:baseUrl];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
    
    return TRUE;
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSString *responseString = [request responseString];
    NSDictionary *responseDict = [responseString JSONValue];
    NSString *gamerString = [responseDict objectForKey:@"Player"];
    NSDictionary *gamerDict = [gamerString JSONValue];
    NSString *gamerTag = [gamerDict objectForKey:@"Gamertag"];
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Error"
                                                   message: error.localizedDescription
                                                  delegate: self
                                         cancelButtonTitle: @"OK"                                      otherButtonTitles: @"",nil];
    [alert show];
}

@end
