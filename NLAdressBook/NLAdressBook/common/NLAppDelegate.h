//
//  NLAppDelegate.h
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLAppDelegate : UIResponder <UIApplicationDelegate>{
    NSManagedObjectContext *_managedObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;

}

@property (retain, nonatomic) UIWindow *window;


@property (retain, nonatomic) UINavigationController *navigationController;

@property (retain, nonatomic) UISplitViewController *splitViewController;

@end
