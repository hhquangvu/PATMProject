//
//  PALocationService.h
//  PATMApp
//
//  Created by Vu Hong on 10/28/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface PALocationService : NSObject <CLLocationManagerDelegate>

+ defaultService;

- getCurrentLocation;
- getAnnotationViewFromServer;
@end
