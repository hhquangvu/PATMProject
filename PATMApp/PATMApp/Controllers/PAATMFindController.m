//
//  PAATMFindController.m
//  PATMApp
//
//  Created by Vu Hong on 10/28/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PAATMFindController.h"

@interface PAATMFindController ()

@end

@implementation PAATMFindController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self getATMFromServer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/****************************************************
 Get Map Item from server (ATM)
 ****************************************************/
-  (void)getATMFromServer
{
    PALocationService *locationService = [PALocationService defaultService];
    NSArray *mapItems = [locationService getAnnotationViewWithType:2];
    for (PALocationItem *item in mapItems) {
        [self.mapView addAnnotation:item];
    }
}
@end
