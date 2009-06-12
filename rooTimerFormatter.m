//
//  rooTimeLeftFormatter.m
//  Countdown

#import "rooTimerFormatter.h"


@implementation rooTimerFormatter




//------------------------------------------------------------------------------
// stringForObjectValue
//------------------------------------------------------------------------------
- (NSString *)stringForObjectValue:(id)anObject
{
    NSInteger secondsLeft = [anObject intValue];
    
    
    // are we there yet?
    if (secondsLeft <= 0) {
        return @"00:00:00";
    }
    
    
    NSInteger hoursLeft     = secondsLeft / 60 / 60;
    NSInteger minutesLeft   = (secondsLeft-(hoursLeft * 60 * 60)) / 60;
    secondsLeft             = secondsLeft - (hoursLeft * 60 * 60) - (minutesLeft * 60);
    
    return [NSString stringWithFormat:@"%02d:%02d:%02d", hoursLeft, minutesLeft, secondsLeft];
}




//------------------------------------------------------------------------------
// attributedStringForObjectValue
//------------------------------------------------------------------------------
- (NSAttributedString *)attributedStringForObjectValue:(id)anObject withDefaultAttributes:(NSDictionary *)attributes
{
    // we could apply color, font, whatever here. but we don't need that.
    
    return [[NSAttributedString alloc] initWithString:[self stringForObjectValue:anObject] attributes:attributes];
}




//------------------------------------------------------------------------------
// getObjectValue
//------------------------------------------------------------------------------
- (BOOL)getObjectValue:(id *)anObject forString:(NSString *)string errorDescription:(NSString **)error
{
    // this is a read only formatter for this sample.
    return YES;
}


@end
