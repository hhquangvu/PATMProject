//
//  PALocationManager.m
//  PATMApp
//
//  Created by Vu Hong on 11/9/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PALocationManager.h"

@implementation PALocationManager

static CLLocationManager *LOCATION_MANAGER;

+ (id)defaultInstance
{
    if (LOCATION_MANAGER == nil) {
        LOCATION_MANAGER = [[CLLocationManager alloc]init];
    }
    return LOCATION_MANAGER;
}

@end
