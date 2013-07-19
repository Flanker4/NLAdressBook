//
//  TTAppDelegate+DataProvider.h
//  DonetskWeather
//
//  Created by Boyko A.V. on 10.07.13.
//  Copyright (c) 2013 IDS Test Task. All rights reserved.
//

#import "NLAppDelegate.h"

extern NSString *const kTTNotificationDataUpdated;


@interface NLAppDelegate (DataProvider)

@property (readonly, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;



- (void)saveContext;
//Core Data
- (NSURL *)applicationDocumentsDirectory;

@end
