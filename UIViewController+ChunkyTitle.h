//
//  ViewController+ChunkyTitle.h
//  Utils
//
//  Created by Jonathan Green on 16/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ChunkyTitle)

/** Update the chunky title for a view with the views title. Adds one if not found.  */
- (void) updateChunkyTitle;

/** Update the chunky title for a view. Adds one if not found.  */
- (void) updateChunkyTitle:(NSString*)title;

@end
