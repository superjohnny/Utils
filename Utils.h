//
//  Utils.h
//  LVDriving
//
//  Created by Jonathan Green on 07/11/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (NSString *) currentOperatingSystemVersion;
+ (BOOL) operatingSystemVersionLessThan:(NSString *) operatingSystemVersionToCompare;
+ (BOOL) operatingSystemVersionLessThanOrEqualTo:(NSString *) operatingSystemVersionToCompare;

+ (BOOL) deviceHasThreePointFiveInchScreen;
+ (BOOL) deviceHasFourInchScreen;
+ (BOOL) deviceHasFourPointSevenInchScreen;
+ (BOOL) deviceHasFivePointFiveInchScreen;
+ (BOOL) deviceHasScreenWithIdiom:(UIUserInterfaceIdiom) userInterfaceIdiom scale:(CGFloat) scale height:(CGFloat) height;

@end
