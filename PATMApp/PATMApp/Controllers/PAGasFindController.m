//
//  PAGasFindController.m
//  PATMApp
//
//  Created by Vu Hong on 10/25/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PAGasFindController.h"

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
	// Do any additional setup after loading the view.
    CLLocationCoordinate2D zoomLocation;
    
    zoomLocation.latitude = 10.762622;
    zoomLocation.longitude = 106.660172;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 400, 400);
    
    [self.mapView setRegion:viewRegion];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - CLLocationManager Life Cycle
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //CLLocation *location = [locations lastObject];
}

#pragma mark - User Defide
- (void)initLocationManager
{
    locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
}
@end
