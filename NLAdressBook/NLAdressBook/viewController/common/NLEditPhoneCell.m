//
//  NLEditPhoneCell.m
//  NLAdressBook
//
//  Created by Boyko A.V. on 20.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLEditPhoneCell.h"
//
// MARK: - NLEditPhoneCell
//
@implementation NLEditPhoneCell
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [_textField setKeyboardType:UIKeyboardTypeDecimalPad];
        //TODO: add auto formatting  phone number
        //http://stackoverflow.com/questions/1246439/uitextfield-for-phone-number
    }
    return self;
}
-(void) fillFromContact:(NLContact*)contact{
    self.value = contact.phone;
}
@end

