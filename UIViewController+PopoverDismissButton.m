//
//  UIView+DismissButton.m
//  LVDriving
//
//  Created by Jonathan Green on 17/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import "UIViewController+PopoverDismissButton.h"
#import "UIView+FrameHelper.h"

@implementation UIViewController (PopoverDismissButton)

- (void) addPopoverDismissButton {
    [self addPopoverDismissButton:self.view];
}

- (void) addPopoverDismissButton:(UIView *) toView {

    UIImage *image = [UIImage imageNamed:@"btn_close_overlay"];
    UIButton *button = [[UIButton alloc] initWithFrame: CGRectMake(self.view.frame.size.width - image.size.width - 10, 10, image.size.width, image.size.height)];

    [button setImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didTouchDismiss:) forControlEvents:UIControlEventTouchUpInside];
    [toView addSubview:button];
}


- (void) didTouchDismiss:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
