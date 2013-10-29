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
    
    [self getGasStationFromServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
