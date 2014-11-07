//
//  UIView+FrameHelper.h
//  LVDriving
//
//  Created by Jonathan Green on 14/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FrameHelper)

- (CGFloat) width;
- (CGFloat) height;
- (CGFloat) left;
- (CGFloat) right;
- (void) setPositionX:(CGFloat) x andY: (CGFloat) y;
- (void) setHeight:(CGFloat) height;

@end
