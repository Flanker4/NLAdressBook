//
//  UINavigationController+NLAddressBook.h
//  NLAdressBook
//
//  Created by flanker on 20.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UIViewAnimationTransitionDefault___ 99
@interface UINavigationController (NLAddressBook)
-(void) pushViewController:(UIViewController *)viewController withAnimation:(UIViewAnimationTransition)animation;
-(UIViewController*) popViewControllerWithAnimation:(UIViewAnimationTransition)animation;
@end
