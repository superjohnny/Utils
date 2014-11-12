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

    if ([string hasPrefix:prefix caseInsensitive:YES] )
        return string;
    
    return [prefix stringByAppendingString:string];
}

- (BOOL) hasPrefix:(NSString *)prefix caseInsensitive:(BOOL) caseInsensitive {
    
    if (!caseInsensitive)
        return [self hasPrefix:prefix];
    
    const NSStringCompareOptions options = NSAnchoredSearch|NSCaseInsensitiveSearch;
    NSRange prefixRange = [self rangeOfString:prefix
                                        options:options];
    return prefixRange.location == 0 && prefixRange.length > 0;
}


@end
