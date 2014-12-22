//
//  HasTabBarViewController.h
//  Utils
//
//  Created by Jonathan Green on 19/12/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

@class TabBarViewController;

@protocol HasTabBarViewController <NSObject>

@property (nonatomic, weak) TabBarViewController *tabBarViewController;

@end
