//
//  CustomMapAnnotationViewController.m
//  CustomMapAnnotation
//
//  Created by mike.tihonchik on 2/11/14.
//  Copyright (c) 2014 mike.tihonchik. All rights reserved.
//

#import "CustomMapAnnotationViewController.h"
#import "CustomMapAnnotation.h"
#import "CustomMapAnnotationView.h"

@interface CustomMapAnnotationViewController ()
@property (nonatomic, retain) CustomMapAnnotation *customMapAnnotation;
@end

@implementation CustomMapAnnotationViewController

@synthesize customMapAnnotation = _customMapAnnotation;
@synthesize mapView = _mapView;

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if (self.customMapAnnotation == nil) {
        self.customMapAnnotation = [[CustomMapAnnotation alloc] initWithCoordinates:view.annotation.coordinate.latitude
            longitude:view.annotation.coordinate.longitude];
    } else {
        self.customMapAnnotation.latitude = view.annotation.coordinate.latitude;
        self.customMapAnnotation.longitude = view.annotation.coordinate.longitude;
    }
    [self.mapView addAnnotation:self.customMapAnnotation];
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    [self.mapView removeAnnotation: self.customMapAnnotation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    CustomMapAnnotationView *customMapAnnotationView = (CustomMapAnnotationView *)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomMapAnnotation"];
    if (!customMapAnnotationView) {
        customMapAnnotationView = [[CustomMapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomMapAnnotation"];
        customMapAnnotationView.contentHeight = 78.0f;
        UIImage *asynchronyLogo = [UIImage imageNamed:@"asynchrony-logo-small.png"];
        UIImageView *asynchronyLogoView = [[UIImageView alloc] initWithImage:asynchronyLogo];
        asynchronyLogoView.frame = CGRectMake(5, 2, asynchronyLogoView.frame.size.width, asynchronyLogoView.frame.size.height);
        [customMapAnnotationView.contentView addSubview:asynchronyLogoView];
    }
    customMapAnnotationView.mapView = self.mapView;
    return customMapAnnotationView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.mapView.delegate = self;
	CLLocationCoordinate2D coordinate = {57.393716, 21.564763};
    MKCoordinateRegion coordinateOptions = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(coordinate, 800, 800)];

    coordinateOptions.span.longitudeDelta  = 0.01;
    coordinateOptions.span.latitudeDelta  = 0.01;
    
	[self.mapView setRegion:coordinateOptions animated:YES];
}

- (void)viewDidUnload {
	self.mapView = nil;
	self.customMapAnnotation = nil;
}

@end
