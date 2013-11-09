//
//  KBUnitOfWork.h
//  KaraBook
//
//  Created by Vu Hong on 10/5/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnitOfWork : NSObject

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
- (void)savedChanges;
+ (id)sharedInstance;

@property (strong, nonatomic) id mapItemRepository;

@end
