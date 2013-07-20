//
//  NLEditCell.h
//  NLAdressBook
//
//  Created by Boyko A.V. on 19.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <UIKit/UIKit.h>

//offset of textbox|segment in EditCell
extern size_t const OFFSET;

typedef NS_ENUM(NSInteger, NLContactAttribute){
    NLContactAttributeName,
    NLContactAttributeSecondName,
    NLContactAttributePatrName,
    NLContactAttributePhone,
    NLContactAttributeMarker,
    NLContactAttributeCount
};

@protocol NLEditCellDelegate <NSObject>
-(void) didValueChanged:(id)newValue forAttribute:(NLContactAttribute)attribute;
-(void) editNextAttributeAfter:(NLContactAttribute) attribute;
@end

//
// MARK: - NLEditCell
//

@interface NLEditCell : UITableViewCell

@property (nonatomic) NLContactAttribute attribute;
@property (nonatomic,assign) id value;
@property (nonatomic,assign) id<NLEditCellDelegate> delegate;

+(NLEditCell*) editCellForAttribute:(NLContactAttribute)attribute inTableView:(UITableView*)tableView;
-(void) valueDidChange;
-(void) fillFromContact:(NLContact*)contact;
@end






