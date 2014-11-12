//
//  ShareActivityProvider.m
//  Utils
//
//  Created by Jonathan Green on 12/11/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "ShareActivityProvider.h"

@implementation ShareActivityProvider

- (id) activityViewController:(UIActivityViewController *)activityViewController itemForActivityType:(NSString *)activityType {
    
    if ([activityType isEqualToString:UIActivityTypeMessage])
        return NSLocalizedString(@"SHARE_MESSAGE_SMS", nil);
    
    if ([activityType isEqualToString:UIActivityTypeMail])
        return NSLocalizedString(@"SHARE_MESSAGE_EMAIL", nil);
    
    if ([activityType isEqualToString:UIActivityTypePostToTwitter])
        return NSLocalizedString(@"SHARE_MESSAGE_TWITTER", nil);
    
    if ([activityType isEqualToString:UIActivityTypePostToFacebook])
        return NSLocalizedString(@"SHARE_MESSAGE_FACEBOOK", nil);
    
    return nil;
}

- (NSString *)activityViewController:(UIActivityViewController *)activityViewController
              subjectForActivityType:(NSString *)activityType {
    
    if ([activityType isEqualToString:UIActivityTypeMail])
        return NSLocalizedString(@"SHARE_MESSAGE_EMAIL_SUBJECT", nil);
    
    return nil;

}

@end
