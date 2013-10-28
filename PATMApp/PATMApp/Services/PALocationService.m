//
//  PALocationService.m
//  PATMApp
//
//  Created by Vu Hong on 10/28/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PALocationService.h"
#import "PALocationItem.h"

@implementation PALocationService

static PALocationService *service;

+ (id)defaultService
{
    if (service == nil) {
        service = [[PALocationService alloc]init];
    }
    return service;
}

- (id)getCurrentLocation
{
    if ([self isTurnOnLocationService]) {
        return [self returnCurrentLocation];
    }
    
    return nil;
}

-  (id)getAnnotationViewFromServer
{
    NSMutableArray *returnData = [[NSMutableArray alloc]initWithCapacity:1];
    UnitOfWork *unitOfWork = [UnitOfWork sharedInstance];
    BaseReponsitory *mapItemRepository = unitOfWork.mapItemRepository;
    NSArray *mapItems = [mapItemRepository getAll];
    for (MapItem *item in mapItems) {
        PALocationItem *location = [[PALocationItem alloc]init];
        [location setData:item];
        [returnData addObject:location];
    }
    return returnData;
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
 Get Current Your Location
 ****************************************************/
- (id)returnCurrentLocation
{
    CLLocationManager *locationManager = [[CLLocationManager alloc]init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager startUpdatingLocation];
    
    NSMutableDictionary *region = [[NSMutableDictionary alloc]initWithCapacity:1];
    [region setObject:[NSNumber numberWithDouble:10.762622] forKey:@"latitude"];
    [region setObject:[NSNumber numberWithDouble:106.660172] forKey:@"longitude"];
    
    return region;
}

@end
