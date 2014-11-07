//
//  UIView+UIHelper.m
//  LVDriving
//
//  Created by Jonathan Green on 27/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import "UIView+UIHelper.h"

@implementation UIView (UIHelper)


- (void) fadeInFromWhiteWithActivity {
    UIView *fade = [[UIView alloc] initWithFrame:self.frame];
    fade.backgroundColor = [UIColor whiteColor];
    [self addSubview:fade];
    
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:self.frame];
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [indicator startAnimating];
    [self addSubview:indicator];
    
    
    [UIView animateWithDuration:1 animations:^{
        fade.alpha = 0;
    } completion:^(BOOL finished) {
        [fade removeFromSuperview];
        [indicator removeFromSuperview];
    }];
}


- (void) fadeInFromWhite {
    UIView *fade = [[UIView alloc] initWithFrame:self.frame];
    fade.backgroundColor = [UIColor whiteColor];
    [self addSubview:fade];
    
    [UIView animateWithDuration:0.3 animations:^{
        fade.alpha = 0;
    } completion:^(BOOL finished) {
        [fade removeFromSuperview];
    }];
}

- (void) fadeOut {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}

- (void) fadeToWhiteWithCompletion:(void (^)(BOOL finished)) completionBlock {

    UIView *fade = [[UIView alloc] initWithFrame:self.frame];
    fade.backgroundColor = [UIColor clearColor];
    [self addSubview:fade];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:self.frame];
    indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [indicator startAnimating];
    [self addSubview:indicator];
    
    [UIView animateWithDuration:0.3 animations:^{
        fade.backgroundColor = [UIColor whiteColor];
    } completion:completionBlock
    ];
}

- (void)addLinearGradientWithColor:(UIColor *)theColor transparentToOpaque:(BOOL)transparentToOpaque {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    //the gradient layer must be positioned at the origin of the view
    CGRect gradientFrame = self.frame;
    gradientFrame.origin.x = 0;
    gradientFrame.origin.y = 0;
    gradient.frame = gradientFrame;
    
    //build the colors array for the gradient
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)[theColor CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.9f] CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.6f] CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.4f] CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.3f] CGColor],
                       (id)[[theColor colorWithAlphaComponent:0.1f] CGColor],
                       nil];
    
    //reverse the color array if needed
    if(transparentToOpaque)
    {
        colors = [[colors reverseObjectEnumerator] allObjects];
    }
    
    //apply the colors and the gradient to the view
    gradient.colors = colors;
    
    [self.layer insertSublayer:gradient atIndex:0];
}


- (void) bounceIn {
    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.001, 0.001);
    
    self.hidden = NO;
    
    [UIView animateWithDuration:0.3/1.5 animations:^{
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3/2 animations:^{
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.9, 0.9);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3/2 animations:^{
                self.transform = CGAffineTransformIdentity;
            }];
        }];
    }];
}
@end
