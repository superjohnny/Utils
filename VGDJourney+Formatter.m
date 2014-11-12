//
//  VGDJourney+Formatter.m
//  Utils
//
//  Created by Jonathan Green on 20/10/2014.
//  Copyright (c) 2014 AngryYak Ltd. All rights reserved.
//

#import "VGDJourney+Formatter.h"
#import <Vanguard/WUNDistanceFormatter.h>
#import "UIColor+Colors.h"
#import <objc/runtime.h>

static NSInteger const kMaxScoreRating = 100;

@interface VGDJourney ()
@property (nonatomic, readonly) UIFont *normalFont;
@end

@implementation VGDJourney (readonly)


#pragma mark - Formatting properties

static NSString *_locationFormat;
static UIFont *_locationFont;
static UIFont *_normalont;
static UIFont *_distanceFont;

- (UIFont *) normalFont {
    if (!_normalont)
        _normalont = [UIFont journeyDetail];
    return  _normalont;
}

- (NSAttributedString *) locationFormatted {
    
    if (!_locationFormat)
        _locationFormat = NSLocalizedString(@"JOURNEY_LOCATION_FORMAT", @"%@ - %@");

    if (!_locationFont)
        _locationFont = [UIFont journeyTitle];
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:_locationFormat, self.preferedStartLocationName, self.preferedEndLocationName]
                                                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys: _locationFont, NSFontAttributeName, [UIColor eastern_blue], NSForegroundColorAttributeName, nil]];
    
    return string;
}


- (NSAttributedString *) dateFormatted {

    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[NSDateFormatter localizedStringFromDate:self.startDate
                                                                                                           dateStyle:NSDateFormatterShortStyle
                                                                                                           timeStyle:NSDateFormatterNoStyle]
                                                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys: self.normalFont, NSFontAttributeName, [UIColor bright_gray], NSForegroundColorAttributeName, nil]];
    return string;
}


- (NSAttributedString *) durationFormatted {
    
    NSString *start = [NSDateFormatter localizedStringFromDate: self.startDate dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
    NSString *end = [NSDateFormatter localizedStringFromDate: self.endDate dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];

    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ - %@", start, end]
                                                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys: self.normalFont, NSFontAttributeName, [UIColor bright_gray], NSForegroundColorAttributeName, nil]];
    return string;
}


-(NSAttributedString *)distanceFormatted{
    
    if (!_distanceFont)
        _distanceFont = [UIFont journeyTitle];
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[WUNDistanceFormatter stringFromDistance:self.distance]
                                                                 attributes:[NSDictionary dictionaryWithObjectsAndKeys: _distanceFont, NSFontAttributeName, [UIColor bright_gray], NSForegroundColorAttributeName, nil]];

    return string;
}


#pragma mark - Wrapping Properties


typedef enum : NSUInteger {
    JourneyScoreRatingTerrible,
    JourneyScoreRatingBad,
    JourneyScoreRatingOK,
    JourneyScoreRatingGood,
    JourneyScoreRatingPerfect
} JourneyScoreRating;

- (JourneyScoreRating) getRatingForScore:(CGFloat) score {
   
    if ((score >= 0) && (score <= 30))
        return JourneyScoreRatingTerrible;
   
    else if ((score >= 31) && (score <= 55))
        return JourneyScoreRatingBad;

    else if ((score >= 56) && (score <= 70))
        return JourneyScoreRatingOK;
    
    else if ((score >= 71) && (score <= 75))
        return JourneyScoreRatingGood;
    
    else
        return JourneyScoreRatingPerfect;
}

- (CGFloat) maxScoreRating {
    return kMaxScoreRating;
}

- (CGFloat) speedScore {
    return ceilf([self subscoreForType:VGDJourneySubscoreSpeed] * kMaxScoreRating);
}

- (CGFloat) smoothnessScore {
    return ceilf([self subscoreForType:VGDJourneySubscoreSmoothness] * kMaxScoreRating);
}

- (UIColor *) colourForScore:(CGFloat) score {
    JourneyScoreRating rating = [self getRatingForScore:score];
    
    switch (rating) {
        case JourneyScoreRatingTerrible:
            return [UIColor ku_crimson];
            
        case JourneyScoreRatingBad:
            return [UIColor sun];
            
        case JourneyScoreRatingOK:
            return [UIColor sandstorm];
            
        case JourneyScoreRatingGood:
            return [UIColor mantis];
            
        case JourneyScoreRatingPerfect:
            return [UIColor mantis];
    }
}

- (UIColor *) speedScoreColour {
    return [self colourForScore:self.speedScore];
}

- (UIColor *) smoothnessScoreColour {
    return [self colourForScore:self.smoothnessScore];
}

- (NSString *) speedScoreMessage {
    JourneyScoreRating rating = [self getRatingForScore:self.speedScore];
    switch (rating) {
        case JourneyScoreRatingTerrible:
            return NSLocalizedString(@"SPEED_SCORE_MESSAGE_TERRIBLE", nil);
            
        case JourneyScoreRatingBad:
            return NSLocalizedString(@"SPEED_SCORE_MESSAGE_BAD", nil);
            
        case JourneyScoreRatingOK:
            return NSLocalizedString(@"SPEED_SCORE_MESSAGE_OK", nil);
            
        case JourneyScoreRatingGood:
            return NSLocalizedString(@"SPEED_SCORE_MESSAGE_GOOD", nil);
            
        case JourneyScoreRatingPerfect:
            return NSLocalizedString(@"SPEED_SCORE_MESSAGE_PERFECT", nil);
    }
}

- (NSString *) smoothnessScoreMessage {
    JourneyScoreRating rating = [self getRatingForScore:self.smoothnessScore];
    switch (rating) {
        case JourneyScoreRatingTerrible:
            return NSLocalizedString(@"SMOOTHESS_SCORE_MESSAGE_TERRIBLE", nil);
            
        case JourneyScoreRatingBad:
            return NSLocalizedString(@"SMOOTHESS_SCORE_MESSAGE_BAD", nil);
            
        case JourneyScoreRatingOK:
            return NSLocalizedString(@"SMOOTHESS_SCORE_MESSAGE_OK", nil);
            
        case JourneyScoreRatingGood:
            return NSLocalizedString(@"SMOOTHESS_SCORE_MESSAGE_GOOD", nil);
            
        case JourneyScoreRatingPerfect:
            return NSLocalizedString(@"SMOOTHESS_SCORE_MESSAGE_PERFECT", nil);
    }
}


- (BOOL) hasFeedback {
    //if the journey has come back from the server the status = VGDJourneyStatusRetrieved (5)
    //and if it does not require attention
    //then we assume there is feedback
    
    if (self.status == VGDJourneyStatusRetrieved && !self.requiresUserAttention) {
        return YES;
    }
    
    return NO;
}


#pragma mark - Test methods

static const char *requiresUserAttentionTestKey = "requiresUserAttentionTestKey";

- (BOOL) requiresUserAttentionTest {
    return ((NSNumber *)objc_getAssociatedObject(self, requiresUserAttentionTestKey)).boolValue;
}

- (void) setRequiresUserAttentionTest:(BOOL)requiresUserAttentionTest {
    objc_setAssociatedObject(self, requiresUserAttentionTestKey, [NSNumber numberWithBool:requiresUserAttentionTest], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
