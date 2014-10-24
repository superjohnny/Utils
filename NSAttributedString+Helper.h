//
//  NSAttributedString+Helper.h
//  Utils
//
//  Created by Jonathan Green on 16/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (Helper)

- (CGSize) sizeForStringInWidth:(CGFloat) width;
- (CGSize) sizeForStringInSize:(CGSize) size;

@end
