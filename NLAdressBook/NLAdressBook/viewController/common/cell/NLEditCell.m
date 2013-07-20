//
//  NLEditCell.m
//  NLAdressBook
//
//  Created by Boyko A.V. on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLEditCell.h"
#import "NLContactAttributeCell.h"



size_t const OFFSET = 10;


@implementation NLEditCell
@dynamic value;
+(NLEditCell*) editCellForAttribute:(NLContactAttribute)attribute
                        inTableView:(UITableView*)tableView
{
    Class CellClass = NULL;

    switch (attribute) {
        case NLContactAttributeMarker:
            CellClass = [NLEditMarkerCell class];
            break;
        case NLContactAttributePhone:
            CellClass = [NLEditPhoneCell class];
            break;
        default:
            CellClass = [NLEditNameCell class];
            break;
    }
    
    NSString *reuseID = NSStringFromClass(CellClass);
    
    
    NLEditCell *cell=(NLEditCell*)[tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (cell == nil) {
        cell = [[[CellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.attribute = attribute;
    return cell;
}

-(void) fillFromContact:(NLContact*)contact{
    assert(!"override");
}
-(void) valueDidChange{
    [self.delegate didValueChanged:self.value forAttribute:self.attribute];
}

-(void) dealloc{
    self.delegate = nil;
    [super dealloc];
}
@end



