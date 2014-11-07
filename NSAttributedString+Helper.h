//
//  NSAttributedString+Helper.h
//  LVDriving
//
//  Created by Jonathan Green on 16/10/2014.
//  Copyright (c) 2014 Wunelli Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (Helper)

/**  * creates an attributed string from the supplied html */
+ (NSAttributedString *) attributedStringFromHtml:(NSString *) htmlString;

/*
 * creates an attributed string from the supplied html and the supplied css styling
 * the styling needs to look a little like this:
 * <style>body { font-family: 'ArialMT';font-size: 18px; color:#58595b; text-align: center;} strong { color:#007d9b; } </style>
 */
+ (NSAttributedString *) attributedStringFromHtml:(NSString *) htmlString withCSS:(NSString *) css;

- (CGSize) sizeForStringInWidth:(CGFloat) width;
- (CGSize) sizeForStringInSize:(CGSize) size;

@end
