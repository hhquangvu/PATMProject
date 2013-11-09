//
//  PABaseMapController.h
//  PATMApp
//
//  Created by Vu Hong on 10/29/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PALocationManager.h"

@interface PABaseMapController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>{
    PALocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)onMeButtonDidTouch:(id)sender;
- (id)getAnnotationViewWithType:(int)type;
@end
