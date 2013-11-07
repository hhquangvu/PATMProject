//
//  PAMapItemRepository.m
//  PATMApp
//
//  Created by Vu Hong on 11/7/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "PAMapItemRepository.h"
#import "SMClient.h"

@implementation PAMapItemRepository

- (BOOL)updateBadGasStation:(NSManagedObject*)object
{
    [object setValue:[NSNumber numberWithInt:-99] forKey:@"rate"];
    
    UnitOfWork *uow = [UnitOfWork sharedInstance];
    [uow savedChanges];
    
    return YES;
}

@end
