//
//  CATextLayer+Extension.m
//  Utils
//
//  Created by Jonathan Green on 24/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "CATextLayer+Extension.h"

@implementation CATextLayer (Extension)

+ (NSString *) convertNSTextAlignmentToCATextAlignment:(NSTextAlignment) textAlignment {
    
    switch (textAlignment) {
        case NSTextAlignmentCenter:
            return kCAAlignmentCenter;
        case NSTextAlignmentJustified:
            return kCAAlignmentJustified;
        case NSTextAlignmentLeft:
            return kCAAlignmentLeft;
        case NSTextAlignmentNatural:
            return kCAAlignmentNatural;
        case NSTextAlignmentRight:
            return kCAAlignmentRight;
    }
}
@end
