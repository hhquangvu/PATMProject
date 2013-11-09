//
//  KBBaseReponsitory.m
//  KaraBook
//
//  Created by Vu Hong on 10/5/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "BaseReponsitory.h"

@implementation BaseReponsitory

// Get Object
- (id)getObjectWithPredicate:(NSPredicate*)predicate
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:[self.class description]];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *fetchError;
    
    id fetchObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    
    if (fetchError) {
        NSLog(@"Cannot Fetch");
        return nil;
    }
    
    if ([fetchObjects count] == 0) {
        NSLog(@"Cannot find Object");
        return nil;
    }
    
    return [fetchObjects lastObject];
}

// get all function
- (NSArray *)getAll
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:[self.class description]];
    
    NSError *fetchError;
    
    id fetchObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    
    if (fetchError) {
        NSLog(@"Cannot Fetch");
        return nil;
    }
    
    return fetchObjects;
}

// Get Objects With Predicate
- (NSArray *)getObjectsWithPredicate:(NSPredicate *)predicate
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]initWithEntityName:[self.class description]];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *fetchError;
    
    id fetchObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
    
    if (fetchError) {
        NSLog(@"Cannot Fetch");
        return nil;
    }
    
    return fetchObjects;
}


// get Model function
- (id)getModel{
    return [NSEntityDescription insertNewObjectForEntityForName:[self.class description] inManagedObjectContext:self.managedObjectContext];
}
@end
