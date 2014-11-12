//
//  Stylist.m
//  Utils
//
//  Created by Jonathan Green on 12/11/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "Stylist.h"

@implementation Stylist

+ (void) setNavigationBarAppearance {
    //nav bar appearance
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]]; //this sets the back chevron to white. But it also upsets the cancel button on the share screen

    [[UINavigationBar appearance] setTitleTextAttributes:
     @{
           NSForegroundColorAttributeName:  [UIColor whiteColor],
           NSFontAttributeName:             [UIFont navbar]
       }];
}

+ (void) setNavigationBarAppearanceForActivity {
    
    //makes the navigation items easier to see when showing the activity
    [[UINavigationBar appearance] setTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{
           NSForegroundColorAttributeName:  [UIColor bright_gray],
           NSFontAttributeName:             [UIFont sectionParagraph],
       }];
}

+ (void) setTabBarAppearance {
    
    [[UITabBar appearance] setTintColor:                [UIColor whiteColor]]; //selected icon color
    [[UITabBar appearance] setSelectedImageTintColor:   [UIColor whiteColor]];
    [[UITabBar appearance] setShadowImage:              [[UIImage alloc] init]]; //remove the shadow
    //remove the background. Setting to nil adds a little cut line through the badges
    [[UITabBar appearance] setBackgroundImage:          [[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:          [UIColor dark_cerulean]];
}

+ (void) setTabBarItemAppearance {
    
    //selected state
    [[UITabBarItem appearance] setTitleTextAttributes:
     @{
           NSForegroundColorAttributeName:  [UIColor whiteColor],
           NSFontAttributeName:             [UIFont tabBar]
       } forState:UIControlStateSelected]; //text color for selected state
    
    //unselected state
    [[UITabBarItem appearance] setTitleTextAttributes:
     @{
           NSForegroundColorAttributeName:  [UIColor curious_blue],
           NSFontAttributeName:             [UIFont tabBar]
       } forState:UIControlStateNormal]; //text color for unselected state
}


@end
