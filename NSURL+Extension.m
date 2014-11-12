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

+ (NSURL*) URLWithStringHttpPrefix:(NSString *) string {
    
    return [NSURL URLWithString:[NSString ensurePrefix:string prefix:@"http://"]];
}

+ (NSURL*) URLWithStringTelPrefix:(NSString *) string {
    
    return [NSURL URLWithString:[NSString ensurePrefix:string prefix:@"tel://"]]; //telprompt: ?
}
@end
