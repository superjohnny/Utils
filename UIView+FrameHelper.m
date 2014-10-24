//
//  UIView+FrameHelper.m
//  Utils
//
//  Created by Jonathan Green on 14/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "UIView+FrameHelper.h"
#import "CGGeometry+Helper.h"

@implementation UIView (FrameHelper)

- (CGFloat) width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat) height {
    return CGRectGetHeight(self.frame);
}

- (CGFloat) left {
    return CGRectGetMinX(self.frame);
}

- (CGFloat) right {
    return CGRectGetMaxX(self.frame);
}

- (void) setPositionX:(CGFloat) x andY: (CGFloat) y {
    self.frame = CGRectUpdatePosition(self.frame, x, y);
}

- (void) setHeight:(CGFloat) height {
    self.frame = CGRectUpdateHeight(self.frame, height);
}



@end
