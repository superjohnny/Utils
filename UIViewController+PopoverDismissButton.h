//
//  UIView+DismissButton.h
//  LVDriving
//
//  Created by Jonathan Green on 17/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PopoverDismissButton)

/** Adds a dismiss button to the top right corner */
- (void) addPopoverDismissButton;

- (void) addPopoverDismissButton:(UIView *) toView;

@end
