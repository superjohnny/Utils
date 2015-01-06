//
//  NSString+Extension.h
//  Utils
//
//  Created by Jonathan Green on 23/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/** returns true if the string is nil, null or empty string */
+ (BOOL) isNullOrEmpty:(NSString *) string;

/** ensures that the given prefix exists on the given string */
+ (NSString *) ensurePrefix:(NSString *) string prefix:(NSString *) prefix;

/** ensures that the given prefix pattern exists on the given string, if not, prepends with default prefix */
+ (NSString *) ensurePrefixPattern:(NSString *) string prefixPattern:(NSString *) prefixPattern defaultPrefix:(NSString *) defaultPrefix;

/** provides case sensitive prefix checking */
- (BOOL) hasPrefix:(NSString *)prefix caseInsensitive:(BOOL) caseInsensitive;

/** provides regex pattern prefix checking */
- (BOOL) hasPrefixPattern:(NSString *)prefixPattern;

/** returns value formatted as string with trailing zeros trimmed if int **/
+ (NSString *) formattedNumber:(CGFloat) value;

@end
