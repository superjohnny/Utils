//
//  NSURL+Extension.h
//  Utils
//
//  Created by Jonathan Green on 24/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Extension)

/** ensures gien string has http prefix */
+ (NSURL*) URLWithStringHttpPrefix:(NSString *) input;

/** ensures gien string has tel prefix */
+ (NSURL*) URLWithStringTelPrefix:(NSString *) string;

@end
