//
//  Utils.m
//  LVDriving
//
//  Created by Jonathan Green on 07/11/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import "Utils.h"

@implementation Utils

#pragma mark - Operating system 

+ (NSString *) currentOperatingSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (BOOL) operatingSystemVersionLessThan:(NSString *) operatingSystemVersionToCompare {
    return ([[self currentOperatingSystemVersion] compare: operatingSystemVersionToCompare options:NSNumericSearch] == NSOrderedDescending);
}

+ (BOOL) operatingSystemVersionLessThanOrEqualTo:(NSString *) operatingSystemVersionToCompare {
    return ([[self currentOperatingSystemVersion] compare: operatingSystemVersionToCompare options:NSNumericSearch] != NSOrderedDescending);
}


#pragma mark - Screen sizes

+ (BOOL) deviceHasThreePointFiveInchScreen {
    return [Utils deviceHasScreenWithIdiom:UIUserInterfaceIdiomPhone scale:2.0 height:480.0];
}

+ (BOOL) deviceHasFourInchScreen {
    return [Utils deviceHasScreenWithIdiom:UIUserInterfaceIdiomPhone scale:2.0 height:568.0];
}

+ (BOOL) deviceHasFourPointSevenInchScreen {
    return [Utils deviceHasScreenWithIdiom:UIUserInterfaceIdiomPhone scale:2.0 height:667.0];
}

+ (BOOL) deviceHasFivePointFiveInchScreen {
    return [Utils deviceHasScreenWithIdiom:UIUserInterfaceIdiomPhone scale:3.0 height:736.0];
}

+ (BOOL) deviceHasScreenWithIdiom:(UIUserInterfaceIdiom) userInterfaceIdiom scale:(CGFloat) scale height:(CGFloat) height {
    
    CGRect mainScreenBounds = [[UIScreen mainScreen] bounds];
    CGFloat mainScreenHeight;
    
    if ([Utils operatingSystemVersionLessThan:@"8.0"])
    {
        mainScreenHeight = mainScreenBounds.size.height;
    }
    else
    {
        mainScreenHeight = (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) ? mainScreenBounds.size.width : mainScreenBounds.size.height;
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == userInterfaceIdiom && [[UIScreen mainScreen] scale] == scale && mainScreenHeight == height)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


@end
