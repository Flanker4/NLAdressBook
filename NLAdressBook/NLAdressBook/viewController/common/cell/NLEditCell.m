//
//  NLEditCell.m
//  NLAdressBook
//
//  Created by flanker on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLEditCell.h"


size_t const OFFSET = 10;


@implementation NLEditCell
@dynamic value;
+(NLEditCell*) editCellForAttribute:(NLContactAttribute)attribute
                        inTableView:(UITableView*)tableView
{
    Class CellClass = NULL;

    switch (attribute) {
        case NLContactAttributeMarker:
            CellClass = [NLEditMarker class];
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
        cell = [[CellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
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


//
// MARK: - NLEditNameCell
//
@implementation NLEditNameCell
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
    [_textField resignFirstResponder];
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

//
// MARK: - NLEditPhoneCell
//
@implementation NLEditPhoneCell
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [_textField setKeyboardType:UIKeyboardTypeDecimalPad];
    }
    return self;
}
-(void) fillFromContact:(NLContact*)contact{
    self.value = contact.phone;
}
@end

//
// MARK: - NLEditMarker
//
@implementation NLEditMarker
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _segmentController = [[UISegmentedControl alloc] initWithItems:[NLContact allMarkers]];
        _segmentController.frame = CGRectMake(OFFSET, OFFSET, self.contentView.frame.size.width-2*OFFSET,
                                              self.contentView.frame.size.height-2*OFFSET);
        _segmentController.segmentedControlStyle = UISegmentedControlStylePlain;
        _segmentController.autoresizingMask = (UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth);
        _segmentController.selectedSegmentIndex = 0;
        [_segmentController addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_segmentController];
    }
    return self;
}

-(IBAction)segmentValueChanged:(id)sender{
    [self valueDidChange];
}

-(void) fillFromContact:(NLContact*)contact{
    self.value = contact.marker;
}

-(id) value{
    return @(_segmentController.selectedSegmentIndex);
}
-(void) setValue:(id)value{
    _segmentController.selectedSegmentIndex = [value intValue];
}

-(void) dealloc{
    [_segmentController release];
    [super dealloc];
}
@end


