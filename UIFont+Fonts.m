//
//  UIFont+Fonts.m
//  LVDriving
//
//  Created by Jonathan Green on 22/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import "UIFont+Fonts.h"
#import "Utils.h"

@implementation UIFont (Fonts)

+ (UIFont *) navbar {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Hvy" size:30];
}

+ (UIFont *) menu {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Hvy" size:25];
}

+ (UIFont *) popoverTitle {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Hvy" size:30];
}

+ (UIFont *) pageTitle {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Hvy" size:30];
}

+ (UIFont *) sectionTitle {
    return [UIFont fontWithName:@"Arial-BoldMT" size:20];
}

+ (UIFont *) sectionParagraph {
    return [UIFont fontWithName:@"ArialMT" size:18];
}

+ (UIFont *) sectionLink {
    return [UIFont fontWithName:@"ArialMT" size:18];
}

+ (UIFont *) historyBadge {
    return [UIFont fontWithName:@"Arial-BoldMT" size:18];
}

+ (UIFont *) pointyButton {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Demi" size:18];
}

+ (UIFont *) tabBar {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Demi" size:16];
}

+ (UIFont *) progressBarTitle {
    return [UIFont fontWithName:@"ArialMT" size:25];
}

+ (UIFont *) progressBarTitleBold {
    return [UIFont fontWithName:@"Arial-BoldMT" size:25];
}

+ (UIFont *) progressBarKey {
    return [UIFont fontWithName:@"Arial-BoldMT" size:18];
}

+ (UIFont *) skipButton {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Hvy" size:25];
}

+ (UIFont *) recordingTitle {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Hvy" size:38];
}

+ (UIFont *) recordingSubtitle {
    return [UIFont fontWithName:@"ArialMT" size:30];
}

+ (UIFont *) discountHeadline {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Hvy" size:35];
}


+ (UIFont *) discountValue {
    
    CGFloat fontSize = 95;
    if ([Utils deviceHasThreePointFiveInchScreen])
        fontSize = 55;
    else if ([Utils deviceHasFivePointFiveInchScreen])
        fontSize = 135;
    
    return [UIFont fontWithName:@"Arial-BoldMT" size:fontSize];
}


+ (UIFont *) discountFurther {
    return [UIFont fontWithName:@"ArialMT" size:15];
}

+ (UIFont *) journeyTitle {
    return [UIFont fontWithName:@"Arial-BoldMT" size:20];
}

+ (UIFont *) journeyDetail {
    return [UIFont fontWithName:@"ArialMT" size:20];
}

+ (UIFont *) whoseDrivingButton {
    return [UIFont fontWithName:@"ITCFranklinGothicStd-Hvy" size:22];
}

+ (UIFont *) inboxItemTitle {
    return [UIFont fontWithName:@"Arial-BoldMT" size:20];
}

+ (UIFont *) inboxItemBody {
    return [UIFont fontWithName:@"ArialMT" size:18];
}

+ (UIFont *) inboxItemSubscript {
    return [UIFont fontWithName:@"ArialMT" size:15];
}

@end
