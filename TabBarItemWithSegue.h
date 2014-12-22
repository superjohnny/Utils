//
//  TabBarItemWithSegue.h
//  Utils
//
//  Created by Jonathan Green on 17/12/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarItemWithSegue : UITabBarItem


/**
 *  The identifier of the segue to perform for this tab bar item
 *
 *  Populate this in interface builders User Defined Runtime variables with the segue identifier.
 */
@property (nonatomic, strong) NSString *segueIdentifier;

@end
