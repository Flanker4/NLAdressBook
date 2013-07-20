//
//  UINavigationController+NLAddressBook.m
//  NLAdressBook
//
//  Created by flanker on 20.07.13.
//  Copyright (c) 2013 Neo Line. All rights reserved.
//

#import "UINavigationController+NLAddressBook.h"

@implementation UINavigationController (NLAddressBook)
-(void) pushViewController:(UIViewController *)viewController withAnimation:(UIViewAnimationTransition)animation{
    //TODO:    UIViewAnimationTransitionNone???????
    if (animation == UIViewAnimationTransitionDefault___) {
        [self pushViewController:viewController animated:YES];
        return;
    }
    [UIView animateWithDuration:0.75f
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         
                         [UIView setAnimationTransition:animation forView:self.view cache:NO];
                     }];
   [self pushViewController:viewController animated:NO];
    
}

-(UIViewController*) popViewControllerWithAnimation:(UIViewAnimationTransition)animation{
    BOOL animated = YES;
    if (animation!=UIViewAnimationTransitionDefault___) {
        animated = NO;
        [UIView animateWithDuration:0.5f
                         animations:^{
                             [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                             [UIView setAnimationTransition:animation forView:self.view cache:NO];
                         }];
        
    }
    return [self popViewControllerAnimated:animated];
}
@end
