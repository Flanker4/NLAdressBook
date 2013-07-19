//
//  NLContactCell.m
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLContactCell.h"

@interface NLContactCell(){
    
    IBOutlet UILabel *_lblLabel;
    IBOutlet UIImageView *_imgMarker;
    IBOutlet UILabel *_lblIndex;
}
@end


@implementation NLContactCell


-(void) fillFromContact:(NLContact *)contact withIndex:(NSIndexPath *)index{
    _lblIndex.text = [NSString stringWithFormat:@"%i.", index.row];
    _imgMarker.image = [contact markerImage];
    _lblLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
                      contact.lastName,contact.firstName,contact.patrName];
    
}

+(NLContactCell*) cellFromTable:(UITableView*)tableView withReuseID:(NSString*) reuseID{
    NLContactCell *cell=(NLContactCell*)[tableView dequeueReusableCellWithIdentifier:reuseID];

    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"NLContactCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects){
            if ([currentObject isKindOfClass:[NLContactCell class]]){
                cell =(NLContactCell*) currentObject;
            }
        }
    }
    return cell;
    
}



- (void)dealloc {
    [_lblIndex release];
    [_imgMarker release];
    [_lblLabel release];
    [super dealloc];
}
@end
