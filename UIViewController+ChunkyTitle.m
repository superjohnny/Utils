//
//  ViewController+ChunkyTitle.m
//  Utils
//
//  Created by Jonathan Green on 16/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "UIViewController+ChunkyTitle.h"
#import "ChunkyTextView.h"
#import "CGGeometry+Helper.h"

@implementation UIViewController (ChunkyTitle)

- (void) updateChunkyTitle {
    [self updateChunkyTitle:self.title];
}

- (void) updateChunkyTitle:(NSString*)title {
    

    ChunkyTextView *chunkyView = (ChunkyTextView *)self.navigationItem.titleView.subviews[0];
    
    
    
    //if there isnt a chunky title in the navigation titleView, add one
    if (!chunkyView) {

        UIView *view = [[UIView alloc] initWithFrame:self.navigationController.navigationBar.frame];
        CGRect rect = CGRectMake(-70, 0, view.frame.size.width, view.frame.size.height);
        chunkyView = [[ChunkyTextView alloc] initWithFrame:rect];
        //chunkyView.titleFont = [UIFont boldSystemFontOfSize:25];
        [view addSubview:chunkyView];
        self.navigationItem.titleView = view;
    }
    
    chunkyView.title = title;
}

@end
