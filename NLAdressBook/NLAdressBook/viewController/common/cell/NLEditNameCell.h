//
//  NLEditNameCell_.h
//  NLAdressBook
//
//  Created by Boyko A.V. on 20.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "NLEditCell.h"

//
// MARK: - NLEditNameCell
//
@interface NLEditNameCell:NLEditCell<UITextFieldDelegate>{
    UITextField *_textField;
}
@property (nonatomic,readonly) UITextField *textField;
@end
