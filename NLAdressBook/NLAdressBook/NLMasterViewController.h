//
//  NLMasterViewController.h
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NLDetailViewController;

#import <CoreData/CoreData.h>

@interface NLMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NLDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
