//
//  PABaseMapController.h
//  PATMApp
//
//  Created by Vu Hong on 10/29/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface PABaseMapController : UIViewController<MKMapViewDelegate>{
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
