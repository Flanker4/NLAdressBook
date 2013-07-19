//
//  NLDetailViewController.h
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (retain, nonatomic) id detailItem;

@property (retain, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
