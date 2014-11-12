//
//  VGDPost+Formatter.m
//  Utils
//
//  Created by Jonathan Green on 31/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "VGDPost+Formatter.h"

@implementation VGDPost (readonly)


- (NSAttributedString *) titleFormatted {
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString: self.title                                                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont inboxItemTitle], NSFontAttributeName, [UIColor eastern_blue], NSForegroundColorAttributeName, nil]];
    
    return string;
}

- (NSAttributedString *) messageFormatted {
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString: self.message                                                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont inboxItemBody], NSFontAttributeName, [UIColor bright_gray], NSForegroundColorAttributeName, nil]];
    
    return string;
}

- (NSAttributedString *) dateFormatted {
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[NSDateFormatter localizedStringFromDate:self.createdDate dateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle] attributes:[NSDictionary dictionaryWithObjectsAndKeys: [UIFont inboxItemSubscript], NSFontAttributeName, [UIColor tiffany_blue], NSForegroundColorAttributeName, nil]];
    return string;
}

@end
