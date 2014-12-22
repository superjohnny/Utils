//
//  TabBarSegue.m
//  Utils
//
//  Created by Jonathan Green on 17/12/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "TabBarSegue.h"
#import "TabBarViewController.h"
#import "HasTabBarViewController.h"

@implementation TabBarSegue

- (void)perform {
    
    TabBarViewController *source = [self sourceViewController];
    UIViewController<HasTabBarViewController> *destination = [self destinationViewController];
    
    
    //remove the previous child, and add the requested one
    if (source.currentChild) {
        [source.currentChild removeFromParentViewController];
        [source.currentChild.view removeFromSuperview];
        source.currentChild = nil;
    }
    
    source.currentChild = destination;
    [source addChildViewController:source.currentChild];

    //take the destination view and ram into source view
    UIView* destinationView = destination.view;
    destinationView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    destinationView.frame = CGRectMake(0, 0, source.container.frame.size.width, source.container.frame.size.height);
    [source.container addSubview:destinationView];
    
    
    [source.currentChild didMoveToParentViewController:source];

    //ensure the child view contains a reference to the tab bar container
    destination.tabBarViewController = source;
    
}

@end
