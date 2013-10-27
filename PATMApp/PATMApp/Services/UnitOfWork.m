//
//  KBUnitOfWork.m
//  KaraBook
//
//  Created by Vu Hong on 10/5/13.
//  Copyright (c) 2013 VUHONG Entertainment. All rights reserved.
//

#import "UnitOfWork.h"
#import "BaseReponsitory.h"
#import "StackMob.h"

@implementation UnitOfWork

static UnitOfWork *unitOfWork;

+ (id)sharedInstance
{
    if (unitOfWork == nil) {
        unitOfWork = [[UnitOfWork alloc]init];
    }
    return unitOfWork;
}

- (BOOL)savedChanges
{
    NSError *error;
    [self.managedObjectContext save:&error];
    
    if (error) {
        NSLog(@"Cannot Save data context");
        return NO;
    }
    
    return YES;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self setUpDataContext];
    }
    return self;
}

- (id)mapItemRepository
{
    if (_mapItemRepository == nil) {
        _mapItemRepository = [[BaseReponsitory alloc]init];
        [_mapItemRepository setManagedObjectContext:self.managedObjectContext];
        [_mapItemRepository setClass:[MapItem class]];
    }
    return _mapItemRepository;
}

- (void)setUpDataContext
{
    [[SMClient defaultClient]coreDataStoreWithManagedObjectModel:self.managedObjectModel];
    
    // Set up data context using Stackmob
    self.managedObjectContext = [[[SMClient defaultClient]coreDataStore]contextForCurrentThread];
    
    // Set up data context using SQLite
    /*
    NSError *error;
    
    NSURL *managedObjectModelUrl = [[NSBundle mainBundle] URLForResource:@"PATMData" withExtension:@"momd"];
    
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:managedObjectModelUrl];
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:managedObjectModel];
    
    NSURL *sqlUrl = [[[NSFileManager defaultManager]URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
    
    sqlUrl = [sqlUrl URLByAppendingPathComponent:@"KaraBook.sqlite"];
    
    [persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlUrl options:nil error:&error];
    
    if (error) {
        NSLog(@"Cannot add SQLITE to persistent");
        return;
    }
    
    self.dataContext = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
    
    [self.dataContext setPersistentStoreCoordinator:persistentStoreCoordinator];
     */
    
}

- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"PATMData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:url];
    return _managedObjectModel;
}

@end
