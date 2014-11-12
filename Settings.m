//
//  Settings.m
//  Utils
//
//  Created by Jonathan Green on 31/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "Settings.h"

static NSString * const InboxLastViewedDateKey = @"InboxLastViewedDateKey";
static NSString * const HistoryLastViewedDateKey = @"HistoryLastViewedDateKey";

@implementation Settings

+ (NSDate *) inboxLastViewedDate {
    NSInteger integer = [[NSUserDefaults standardUserDefaults] integerForKey:InboxLastViewedDateKey];
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:integer];
    return date;
}

+ (void) updateInboxLastViewedDate {
    [[NSUserDefaults standardUserDefaults] setInteger:[NSDate new].timeIntervalSinceReferenceDate forKey:InboxLastViewedDateKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSDate *) historyLastViewedDate {
    NSInteger integer = [[NSUserDefaults standardUserDefaults] integerForKey:HistoryLastViewedDateKey];
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:integer];
    return date;
}

+ (void) updateHistoryLastViewedDate {
    [[NSUserDefaults standardUserDefaults] setInteger:[NSDate new].timeIntervalSinceReferenceDate forKey:HistoryLastViewedDateKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
