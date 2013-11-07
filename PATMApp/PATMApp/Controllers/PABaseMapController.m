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
    
    [self initLocationService];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if (!canUpdate) return;
    
    canUpdate = NO;
    
    CLLocation *location = [locations lastObject];
    
    if (!location) return;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 800, 800);
    
    [self.mapView setRegion:viewRegion];
}

- (IBAction)onMeButtonDidTouch:(id)sender {
    canUpdate = YES;
}

#pragma mark - User Defide
/****************************************************
 Check your location services is turn on
 ****************************************************/
- (BOOL)isTurnOnLocationService
{
    if ([CLLocationManager locationServicesEnabled] == NO) {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Can't find your location" message:@"Please turn on your Location Service" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [alertView show];
        return NO;
        
    } else {
        return YES;
    }
    
}


/****************************************************
 Init from Location Service
 ****************************************************/
- (void)initLocationService
{
    canUpdate = YES;
    locationManager = [[CLLocationManager alloc]init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager setDelegate:self];
    [locationManager startUpdatingLocation];
    
}


- (id)getAnnotationViewWithType:(int)type
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"type=%d",type];
    
    NSMutableArray *returnData = [[NSMutableArray alloc]initWithCapacity:1];
    UnitOfWork *unitOfWork = [UnitOfWork sharedInstance];
    BaseReponsitory *mapItemRepository = unitOfWork.mapItemRepository;
    NSArray *mapItems = [mapItemRepository getObjectsWithPredicate:predicate];
    for (MapItem *item in mapItems) {
        PALocationItem *location = [[PALocationItem alloc]init];
        [location setData:item];
        [returnData addObject:location];
    }
    return returnData;
}


@end
