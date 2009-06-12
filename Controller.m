//
//  Controller.m
//  Countdown

#import "Controller.h"
#import "rooTimeLeftFormatter.h"


@interface Controller(private)
- (void) timerFired:(NSTimer *)theTimer;
@end


@implementation Controller

@synthesize secondsLeft = _secondsLeft;


//------------------------------------------------------------------------------
// awakeFromNib
//------------------------------------------------------------------------------
- (void) awakeFromNib
{
    [countdownCell setFormatter:[[rooTimeLeftFormatter alloc] init]];
}



//------------------------------------------------------------------------------
// countdown
//------------------------------------------------------------------------------
- (IBAction) countdown:(id)sender
{
    NSInteger secondsLeft = [minutesToCountTextField intValue] * 60;
    endAt = [[NSDate dateWithTimeIntervalSinceNow:secondsLeft] retain];
    
    timer = [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] retain];
    
    // call it once now so we don't have to wait a second
    [self timerFired:timer];
}



//------------------------------------------------------------------------------
// timerFired
//------------------------------------------------------------------------------
- (void) timerFired:(NSTimer *)theTimer
{
    // update the displayed time left
    self.secondsLeft = [endAt timeIntervalSince1970] - [[NSDate date] timeIntervalSince1970];
    
    
    // are we there yet?
    if (self.secondsLeft <= 0) {
        self.secondsLeft = 0;
        
        [timer invalidate];
        [timer release];
        timer = nil;
        
        [endAt release];
        endAt = nil;
    }
}

@end
