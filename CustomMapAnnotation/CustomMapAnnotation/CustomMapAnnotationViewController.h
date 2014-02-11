//
//  CustomMapAnnotationViewController.h
//  CustomMapAnnotation
//
//  Created by mike.tihonchik on 2/11/14.
//  Copyright (c) 2014 mike.tihonchik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CustomMapAnnotation.h"

@interface CustomMapAnnotationViewController : UIViewController <MKMapViewDelegate> {
	MKMapView *_mapView;
	CustomMapAnnotation *_customMapAnnotation;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
