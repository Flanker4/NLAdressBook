//
//  NLContactViewController.h
//  NLAdressBook
//
//  Created by Boyko A.V. on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NLContactAttributeCell.h"
@interface NLContactViewController : UITableViewController<NLEditCellDelegate>

//
// DESCRIPTION: init
// PARAMS:      contactItem. If nil - create new
// RESULT:      void
//
-(id) initWithContact:(NLContact*) contactItem;
@end
