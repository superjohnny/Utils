//
//  Settings.h
//  LVDriving
//
//  Created by Jonathan Green on 31/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject

/** The date the inbox was last viewed */
+ (NSDate *) inboxLastViewedDate;

/** Updates the date the inbox was last viewed */
+ (void) updateInboxLastViewedDate;


/** The date the history was last viewed */
+ (NSDate *) historyLastViewedDate;

/** Updates the date the history was last viewed */
+ (void) updateHistoryLastViewedDate;


@end
