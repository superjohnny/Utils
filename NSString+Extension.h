//
//  NSString+Extension.h
//  LVDriving
//
//  Created by Jonathan Green on 23/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/** returns true if the string is nil, null or empty string */
+ (BOOL) isNullOrEmpty:(NSString *) string;

/** enures that the given prefix exists on the given string */
+ (NSString *) ensurePrefix:(NSString *) string prefix:(NSString *) prefix;

/** provides case sensitive prefix checking*/
- (BOOL) hasPrefix:(NSString *)prefix caseInsensitive:(BOOL) caseInsensitive;


@end
