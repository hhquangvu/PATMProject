//
//  PALocationItem.m
//  PATMApp
//
//  Created by Vu Hong on 10/26/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PALocationItem.h"

@implementation PALocationItem

- (void)setData:(MapItem *)mapItem
{
    _mapItem = mapItem;
    _coordinate.latitude = _mapItem.maplat.floatValue;
    _coordinate.longitude = _mapItem.maplong.floatValue;
}

- (NSString *)title
{
    return _mapItem.name;
}

- (NSString *)subtitle
{
    return _mapItem.address;
}

- (CLLocationCoordinate2D)coordinate
{
    return _coordinate;
}
@end
