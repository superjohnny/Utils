//
//  UIColor+Colors.m
//  Utils
//
//  Created by Jonathan Green on 13/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
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



#define GLOBAL_COLOR_HEX(NAME, HEX, ALPHA) \
\
+ (UIColor *) NAME \
{ \
    static UIColor *color; \
    static dispatch_once_t once; \
    dispatch_once(&once, ^{ \
    color = [UIColor colorWithRed:((float)((HEX & 0xFF0000) >> 16))/255.0 green:((float)((HEX & 0x00FF00) >>  8))/255.0 blue:((float)((HEX & 0x0000FF) >>  0))/255.0 alpha:ALPHA];\
    }); \
    \
    return color; \
}


@implementation UIColor (Colors)

GLOBAL_COLOR_ALPHA(limerick, 0.55, 0.73, 0.22, 1);
GLOBAL_COLOR_ALPHA(apple, 0.35, 0.74, 0.22, 1);
//GLOBAL_COLOR_ALPHA(christi, 0.43, 0.74, 0.04, 1);
GLOBAL_COLOR_HEX(christi, 0x6fbc0a, 1);
GLOBAL_COLOR_ALPHA(pattens_blue, 0.84, 0.93, 0.96, 1);
//GLOBAL_COLOR_ALPHA(eastern_blue, 0, 0.49, 0.59, 1);
GLOBAL_COLOR_HEX(eastern_blue, 0x007d9b, 1);

GLOBAL_COLOR_ALPHA(dark_cerulean, 0, 0.25, 0.45, 1);
GLOBAL_COLOR_ALPHA(curious_blue, 0.2, 0.53, 0.74, 1);
GLOBAL_COLOR_ALPHA(oxford_blue, 0, 0.18, 0.26, 1);
GLOBAL_COLOR_ALPHA(rich_electric_blue, 0, 0.6, 0.88, 1);
//GLOBAL_COLOR_ALPHA(la_palma, 0.2, 0.56, 0.23, 1);
GLOBAL_COLOR_HEX(la_palma, 0x1f9607, 1);

GLOBAL_COLOR_ALPHA(la_salle_green, 0.04, 0.51, 0.15, 1);
GLOBAL_COLOR_ALPHA(up_forest_green, 0.02, 0.32, 0.11, 1);
GLOBAL_COLOR_ALPHA(spray, 0.52, 0.81, 0.87, 1);
GLOBAL_COLOR_ALPHA(seagull, 0.43, 0.75, 0.8, 1);
GLOBAL_COLOR_ALPHA(tiffany_blue, 0, 0.68, 0.71, 1);
//GLOBAL_COLOR_ALPHA(polo_blue, 0.55, 0.73, 0.78, 1);
GLOBAL_COLOR_HEX(polo_blue, 0x7aa9bc, 1);

GLOBAL_COLOR_ALPHA(meat_brown, 0.94, 0.69, 0.22, 1);
//GLOBAL_COLOR_ALPHA(north_texas_green, 0, 0.59, 0.17, 1);
GLOBAL_COLOR_HEX(north_texas_green, 0x1f9607, 1);

//GLOBAL_COLOR_ALPHA(bright_gray, 0.35, 0.35, 0.36, 1);
GLOBAL_COLOR_HEX(bright_gray, 0x58595b, 1);

GLOBAL_COLOR_ALPHA(ku_crimson, 0.98, 0, 0.07, 1);
GLOBAL_COLOR_ALPHA(sun, 0.95, 0.58, 0.18, 1);
GLOBAL_COLOR_ALPHA(sandstorm, 0.92, 0.82, 0.25, 1);
//GLOBAL_COLOR_ALPHA(mantis, 0.53, 0.8, 0.31, 1);
GLOBAL_COLOR_HEX(mantis, 0x93ca33, 1);


GLOBAL_COLOR_HEX(shalimar, 0xFFFBAC, 1);
GLOBAL_COLOR_ALPHA(cerulean, 0, 0.5, 0.69, 1);


@end


