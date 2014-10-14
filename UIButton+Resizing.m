//
//  UIButton+Resizing.m
//
//  Created by Jonathan Green on 10/10/2014.
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
