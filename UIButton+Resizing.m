//
//  UIButton+Resizing.m
//  RedDrive
//
//  Created by Jonathan Green on 10/10/2014.
//  Copyright (c) 2014 Wunelli. All rights reserved.
//

#import "UIButton+Resizing.h"

@implementation UIButton (Resizing)

- (void) resizeForContent {
    
    CGSize imageSize = self.imageView.image.size;
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0, 0.0);
    
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, - titleSize.width);
}
@end
