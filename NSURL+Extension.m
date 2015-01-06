//
//  NSURL+Extension.m
//  Utils
//
//  Created by Jonathan Green on 24/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "NSURL+Extension.h"
#import "NSString+Extension.h"

@implementation NSURL (Extension)

+ (NSURL*) URLWithStringHttpScheme:(NSString *) string {
 
    return [NSURL URLWithString:[NSString ensurePrefixPattern:string prefixPattern:@"http(s)?://" defaultPrefix:@"http://"]];
}

+ (NSURL*) URLWithStringTelScheme:(NSString *) string {
    
    return [NSURL URLWithString:[NSString ensurePrefix:string prefix:@"telprompt://"]]; //telprompt: ?
}

+ (BOOL) appSupportsUrlScheme:(NSString *) scheme {
    NSDictionary *urlTypes = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleURLTypes"][0];
    NSArray *urlSchemes = [urlTypes objectForKey:@"CFBundleURLSchemes"];
    return [urlSchemes indexOfObject:scheme] != NSNotFound;
}
@end
