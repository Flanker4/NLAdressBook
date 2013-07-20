//
//  NLEditNameCell_.m
//  NLAdressBook
//
//  Created by Boyko A.V. on 20.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLEditNameCell.h"


//
// MARK: - NLEditNameCell
//
@implementation NLEditNameCell
@synthesize textField=_textField;
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(OFFSET, OFFSET,
                                                                   self.contentView.frame.size.width-2*OFFSET,
                                                                   self.contentView.frame.size.height-2*OFFSET)];
        _textField.autoresizingMask = (UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth);
        _textField.delegate = self;
        [self.contentView addSubview:_textField];
    }
    return self;
}

-(void) textFieldDidEndEditing:(UITextField *)textField{
    [self valueDidChange];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //[_textField resignFirstResponder];
    [self.delegate editNextAttributeAfter:self.attribute];
    return YES;
}
-(id) value{
    return _textField.text;
}
-(void) setValue:(id)value{
    _textField.text = value;
}

-(void) fillFromContact:(NLContact*)contact{
    switch (self.attribute) {
        case NLContactAttributeName:
            self.value = contact.firstName;
            break;
        case NLContactAttributePatrName:
            self.value= contact.patrName;
            break;
        default:
            self.value = contact.lastName;
            break;
    }
}
-(void) dealloc{
    [_textField release];
    [super dealloc];
}
@end

