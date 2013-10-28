//
//  MapItem.h
//  PATMApp
//
//  Created by Vu Hong on 10/27/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MapItem : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * corporation;
@property (nonatomic, retain) NSString * mapitem_id;
@property (nonatomic, retain) NSNumber * maplat;
@property (nonatomic, retain) NSNumber * maplong;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * rate;
@property (nonatomic, retain) NSString * sm_owner;
@property (nonatomic, retain) NSNumber * type;

@end
