//
//  VGDJourney+Formatter.h
//  Utils
//
//  Created by Jonathan Green on 20/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import <Vanguard/Vanguard.h>

@interface VGDJourney (readonly)

@property (nonatomic, readonly) NSAttributedString * locationFormatted;
@property (nonatomic, readonly) NSAttributedString * dateFormatted;
@property (nonatomic, readonly) NSAttributedString * durationFormatted;
@property (nonatomic, readonly) NSAttributedString * distanceFormatted;

@property (nonatomic, readonly) CGFloat maxScoreRating;


@property (nonatomic, readonly) CGFloat smoothnessScore;
@property (nonatomic, readonly) UIColor * smoothnessScoreColour;
@property (nonatomic, readonly) NSString * smoothnessScoreMessage;

@property (nonatomic, readonly) CGFloat speedScore;
@property (nonatomic, readonly) UIColor * speedScoreColour;
@property (nonatomic, readonly) NSString * speedScoreMessage;

@property (nonatomic, readonly) BOOL hasFeedback;

//@property (nonatomic) BOOL requiresUserAttentionTest;



@end
