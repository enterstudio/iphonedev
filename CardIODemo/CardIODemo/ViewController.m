//
//  ViewController.m
//  CardIODemo
//
//  Created by mike.tihonchik on 3/31/14.
//  Copyright (c) 2014 mike.tihonchik. All rights reserved.
//

#import "ViewController.h"
#import "CardIO.h"
#import "Constants.h"

@interface ViewController () <CardIOPaymentViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation ViewController

#pragma mark - View Lifecycle
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.infoLabel.text = @"";

    UIButton *scanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scanButton addTarget:self action:@selector(scanCardClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scanButton setTitle:@"Scan Card" forState:UIControlStateNormal];
    scanButton.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:scanButton];
    
    UILabel *cardIOLabel =  [[UILabel alloc] initWithFrame: CGRectMake(80.0, 350.0, 160.0, 40.0)];
    cardIOLabel.text = @"card.io";
    cardIOLabel.font = HELVETICA_BOLD(48);
    cardIOLabel.textColor = [UIColor colorWithRed:(102/255.f) green:(255/255.f) blue:(0/255.f) alpha:1.0f];
    [self.view addSubview:cardIOLabel];
}

#pragma mark - User Actions

- (void)scanCardClicked:(id)sender {
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    scanViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    scanViewController.appToken = @"ec637aaed7e4446da73c385fbbf67aab";
    [self presentViewController:scanViewController animated:YES completion:nil];
}

#pragma mark - CardIOPaymentViewControllerDelegate

- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"Scan succeeded with info: %@", info);
    // Do whatever needs to be done to deliver the purchased items.
    [self dismissViewControllerAnimated:YES completion:nil];
    
    self.infoLabel.text = [NSString stringWithFormat:@"Received card info. Number: %@, expiry: %02lu/%lu, cvv: %@.", info.redactedCardNumber, (unsigned long)info.expiryMonth, (unsigned long)info.expiryYear, info.cvv];
}

- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)paymentViewController {
    NSLog(@"User cancelled scan");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
