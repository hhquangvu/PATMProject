//
//  PALocationItem.h
//  PATMApp
//
//  Created by Vu Hong on 10/26/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PALocationItem : NSObject<MKAnnotation> {
    @private
    CLLocationCoordinate2D _coordinate;
    @private
    MapItem *_mapItem;
}

- (void)setData:(MapItem*)mapItem;

@end
