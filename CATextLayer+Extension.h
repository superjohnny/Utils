//
//  CATextLayer+Extension.h
//  LVDriving
//
//  Created by Jonathan Green on 24/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CATextLayer (Extension)

+ (NSString *) convertNSTextAlignmentToCATextAlignment:(NSTextAlignment) textAlignment;

@end
