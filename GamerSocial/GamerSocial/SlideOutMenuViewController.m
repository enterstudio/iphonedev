//
//  SlideOutMenuViewController.m
//  GamerSocial
//
//  Created by mike.tihonchik on 9/9/13.
//  Copyright (c) 2013 mike.tihonchik. All rights reserved.
//

#import "SlideOutMenuViewController.h"
#import "SlideNavigationController.h"
#import "AppDelegate.h"
#import "GamerSocialGlobals.h"
#import "CustomMenuCell.h"

@interface SlideOutMenuViewController ()
@end

@implementation SlideOutMenuViewController
@synthesize navData=_navData;
@synthesize navImages=_navImages;
@synthesize navTableView=_navTableView;
@synthesize userImageView=_userImageView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self loadUserIntoView];
}

- (void)loadUserIntoView{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
/*    User *user = delegate.user;
    if( user == nil){
        user = [_contactsDao getUser];
        delegate.user = user;
    }
    self.userFullName.text = [user getFullName];
    self.userHeadline.text = user.headline;

*/
    //set user image
//    self.userImageView.image = [user getPhoto];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topView.backgroundColor = [UIColor colorWithRed:38/255.0f green:144/255.0f blue:207/255.0f alpha:1];
    self.userHeadline.backgroundColor = [UIColor colorWithRed:38/255.0f green:144/255.0f blue:207/255.0f alpha:1];
    
    _navData = [NSArray arrayWithObjects:@"New Connection", @"Sent Connections", @"Settings", @"About", @"Log Out", nil];
    _navImages = [NSArray arrayWithObjects:@"nav_slide_plus.png", @"nav_slide_plane.png", @"nav_slide_gears.png", @"nav_slide_about.png", @"nav_slide_logout.png", nil];
    
    NSString *userStoredNotification = @"userStoredNotification";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadUserIntoView) name:userStoredNotification object:nil];
    
    self.clearsSelectionOnViewWillAppear = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_navData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"slideMenuCell";
    CustomMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomMenuCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    [cell setBackgroundColor:[UIColor redColor]];
    cell.navName.text = [_navData objectAtIndex:indexPath.row];
    cell.tag = indexPath.row;
    
    NSString *imageName = [_navImages objectAtIndex:indexPath.row];
    cell.navImage.image = [UIImage imageNamed:imageName];

    return cell;
 */
    return [[UITableViewCell init] alloc];
}

- (float)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // This will create a "invisible" footer
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    // To "clear" the footer view
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int rowHeight = 67;
    if( IS_IPHONE_5 )
        rowHeight = 73;
    return rowHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.backgroundColor = [UIColor colorWithRed:11/255.0f green:84/255.0f blue:119/255.0f alpha:1];
}

- (void) viewWillDissappear:(BOOL)animated {
    [_navTableView deselectRowAtIndexPath:[_navTableView indexPathForSelectedRow] animated:animated];
    [super viewWillAppear:animated];
}

-(void)showInfoAlertView:(NSString *)message title:(NSString *)title {
    NSLog(@"Error: %@", message);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle: nil];
	UIViewController *currentViewController;
	
	switch (indexPath.row)
	{
		case 0:
			//TODO - This neeeds to be the new connection process
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                currentViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"camera"];
            }
            else{
                [self showInfoAlertView:@"I'm sorry but your device does not have a camera." title:@"Device issue"];
                currentViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"home"];
            }
			break;
		case 1:
			currentViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"home"];
			break;
		case 2:
			currentViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"settings"];
			break;
        case 3:
            //TODO - This neeeds to be the share process
			currentViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"about"];
			break;
        case 4:
			currentViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"login"];
			break;
	}
	
	[[SlideNavigationController sharedInstance] switchToViewController:currentViewController withCompletion:nil];
    
}

@end
