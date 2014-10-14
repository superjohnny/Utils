//
//  UIColor+Colors.m
//
//  Created by Jonathan Green on 13/10/2014.
//

#import "UIColor+Colors.h"

#define GLOBAL_COLOR(NAME, RED, GREEN, BLUE) GLOBAL_COLOR_ALPHA(NAME, RED, GREEN, BLUE, 1) 
#define GLOBAL_COLOR_ALPHA(NAME, RED, GREEN, BLUE, ALPHA) \
\
+ (UIColor *) NAME \
{ \
    static UIColor *color; \
    static dispatch_once_t once; \
    dispatch_once(&once, ^{ \
        color = [UIColor colorWithRed:RED green:GREEN blue:BLUE alpha:ALPHA]; \
    }); \
    \
    return color; \
} // RED GREEN BLUE RGB

@implementation UIColor (Colors)

GLOBAL_COLOR_ALPHA(limerick, 0.55, 0.73, 0.22, 1)
GLOBAL_COLOR_ALPHA(pattens_blue, 0.84, 0.93, 0.96, 1)
GLOBAL_COLOR_ALPHA(eastern_blue, 0, 0.49, 0.59, 1)

@end


