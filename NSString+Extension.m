//
//  NSString+Extension.m
//  Utils
//
//  Created by Jonathan Green on 23/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

+ (BOOL) isNullOrEmpty:(NSString *) string {
    if (!string)
        return YES;

    if ([string isEqual:[NSNull null]])
        return YES;
    
    if ([string isEqualToString:@""])
        return YES;
    
    return  NO;
}

+ (NSString *) ensurePrefix:(NSString *) string prefix:(NSString *) prefix {
    if (!string) return nil;
    
    if ([string hasPrefix:prefix caseInsensitive:YES] )
        return string;
    
    return [prefix stringByAppendingString:string];
}

+ (NSString *) ensurePrefixPattern:(NSString *) string prefixPattern:(NSString *) prefixPattern defaultPrefix:(NSString *) defaultPrefix {
    if (!string) return nil;
    
    if ([string hasPrefixPattern:prefixPattern])
        return string;
    
    return [defaultPrefix stringByAppendingString:string];
}

- (BOOL) hasPrefix:(NSString *)prefix caseInsensitive:(BOOL) caseInsensitive {
    
    if (!caseInsensitive)
        return [self hasPrefix:prefix];
    
    const NSStringCompareOptions options = NSAnchoredSearch | NSCaseInsensitiveSearch;
    NSRange prefixRange = [self rangeOfString:prefix
                                        options:options];
    return prefixRange.location == 0 && prefixRange.length > 0;
}


- (BOOL) hasPrefixPattern:(NSString *)prefixPattern {

    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:prefixPattern options:NSRegularExpressionCaseInsensitive error:&error];
    NSRange range = [regex rangeOfFirstMatchInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length)];
    
    return !(range.location == NSNotFound);
}

+ (NSString *) formattedNumber:(CGFloat) value {
    
    if ((value - (int)value) > 0)
        return [NSString stringWithFormat:@"%1.1f", value];
    else
        return [NSString stringWithFormat:@"%i", (int)value];
    
}

@end
