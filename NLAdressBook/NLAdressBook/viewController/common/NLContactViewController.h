//
//  NLContactViewController.h
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLEditCell.h"
@interface NLContactViewController : UITableViewController<NLEditCellDelegate>

//
// DESCRIPTION: init
// PARAMS:      contactItem. If nil - create new
// RESULT:      void
//
-(id) initWithContact:(NLContact*) contactItem;
@end
