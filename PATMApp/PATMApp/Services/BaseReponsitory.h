//
//  KBBaseReponsitory.h
//  KaraBook
//
//  Created by Vu Hong on 10/5/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseReponsitory : NSObject

@property (strong, nonatomic) Class class;
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;

- (id)getModel;
- (NSArray*)getAll;
- (NSArray*)getObjectsWithPredicate:(NSPredicate*)predicate;
@end
