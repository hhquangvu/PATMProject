//
//  PAGasFindController.m
//  PATMApp
//
//  Created by Vu Hong on 10/25/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PAGasFindController.h"
#import "PAGasDetailController.h"

@interface PAGasFindController ()

@end

@implementation PAGasFindController

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
    
    // Set delegate for map view, very important
    [self.mapView setDelegate:self];
    
    [self getGasStationFromServer];
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
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:@"MyLocation"];
    
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"MyLocation"];
    }
    
    annotationView.annotation = annotation;
    annotationView.canShowCallout = YES;
    annotationView.enabled = YES;
    annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    PALocationItem *locationItem = annotation;
    
    if ([locationItem.getMapItem.rate intValue] < -10) {
        annotationView.image = [UIImage imageNamed:@"ico_pin_red"];
    } else {
        annotationView.image = [UIImage imageNamed:@"ico_pin_green"];
    }

    return annotationView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    PAGasDetailController *gasDetailController = [storyboard instantiateViewControllerWithIdentifier:[PAGasDetailController description]];
    
    PALocationItem *locationItem = view.annotation;
    [gasDetailController setMapItem:locationItem.getMapItem];
    
    [self.navigationController pushViewController:gasDetailController animated:YES];
}

/****************************************************
 Get Map Item from server (Gas)
 ****************************************************/
-  (void)getGasStationFromServer
{
    PALocationService *locationService = [PALocationService defaultService];
    NSArray *mapItems = [locationService getAnnotationViewWithType:1];
    for (PALocationItem *item in mapItems) {
        [self.mapView addAnnotation:item];
    }
}
@end
