//
//  VGDPost+Formatter.h
//  Utils
//
//  Created by Jonathan Green on 31/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import <Vanguard/Vanguard.h>
#import <Vanguard/VGDPost.h>

@interface VGDPost (readonly)

@property (nonatomic, readonly) NSAttributedString * titleFormatted;
@property (nonatomic, readonly) NSAttributedString * messageFormatted;
@property (nonatomic, readonly) NSAttributedString * dateFormatted;

@end
