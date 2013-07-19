//
//  NLContactCell.h
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NLContactCell : UITableViewCell
-(void) fillFromContact:(NLContact*)contact withIndex:(NSIndexPath*)index;

+(NLContactCell*) cellFromTable:(UITableView*)tableView withReuseID:(NSString*) reuseID;
@end
