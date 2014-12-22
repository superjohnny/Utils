//
//  TabBarViewController.h
//  Utils
//
//  Created by Jonathan Green on 15/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarViewController : UIViewController <UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UIView *container;
@property (nonatomic, strong) UIViewController *currentChild;

- (void)updateBadges;

@end
