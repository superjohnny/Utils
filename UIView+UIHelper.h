//
//  UIView+UIHelper.h
//  LVDriving
//
//  Created by Jonathan Green on 27/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIHelper)

- (void) fadeInFromWhiteWithActivity;

- (void) fadeInFromWhite;

- (void) fadeOut;

- (void) fadeToWhiteWithCompletion:(void (^)(BOOL finished)) completionBlock;

- (void) addLinearGradientWithColor:(UIColor *)theColor transparentToOpaque:(BOOL)transparentToOpaque;


- (void) bounceIn;

@end
