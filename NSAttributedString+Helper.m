//
//  NSAttributedString+Helper.m
//  Utils
//
//  Created by Jonathan Green on 16/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "NSAttributedString+Helper.h"


@implementation NSAttributedString (Helper)

- (CGSize) sizeForStringInWidth:(CGFloat) width {
    return [self sizeForStringInSize:CGSizeMake(width, CGFLOAT_MAX)];
}

- (CGSize) sizeForStringInSize:(CGSize) size {
    CGRect outputRect = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    
    //do a little rounding to avoid blur
    return CGSizeMake(ceilf(outputRect.size.width), ceilf(outputRect.size.height));

}
@end
