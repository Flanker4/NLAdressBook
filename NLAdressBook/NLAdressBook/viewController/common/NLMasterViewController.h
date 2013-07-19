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

@property (retain, nonatomic) NLDetailViewController *detailViewController;

@property (retain, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (retain, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
