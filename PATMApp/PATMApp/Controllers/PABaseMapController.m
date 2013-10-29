//
//  PABaseMapController.m
//  PATMApp
//
//  Created by Vu Hong on 10/29/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PABaseMapController.h"

@interface PABaseMapController ()

@end

@implementation PABaseMapController

#pragma mark - Life Cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Init Location Service
    [self initLocationService];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - CLLocationManager Life Cycle
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if (![annotation isKindOfClass:[PALocationItem class]]) {
        return nil;
    }
    
    MKAnnotationView *annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"MyLocation"];
    
    if (annotationView == nil) {
        annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"MyLocation"];
        annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    
    annotationView.canShowCallout = YES;
    annotationView.enabled = YES;
    annotationView.annotation = annotation;
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"SS");
}

#pragma mark - User Defide
/****************************************************
 Init from Location Service
 ****************************************************/
- (void)initLocationService
{
    PALocationService *locationService = [PALocationService defaultService];
    
    NSDictionary *dic = [locationService getCurrentLocation];
    NSNumber *latitude = [dic objectForKey:@"latitude"];
    NSNumber *longitude = [dic objectForKey:@"longitude"];
    
    CLLocationCoordinate2D zoomLocation;
    
    zoomLocation.latitude = [latitude doubleValue];
    zoomLocation.longitude = [longitude doubleValue];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 800, 800);
    
    [self.mapView setRegion:viewRegion];
}
@end
