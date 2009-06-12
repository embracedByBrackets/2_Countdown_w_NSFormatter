//
//  Controller.h
//  Countdown

#import <Cocoa/Cocoa.h>


@interface Controller : NSObject {
    IBOutlet NSTextField *      minutesToCountTextField;
    IBOutlet NSTextFieldCell *  countdownCell;
    
    NSDate *                endAt;
    NSTimer *               timer;
    
    NSInteger               _secondsLeft;
}

@property (assign) NSInteger secondsLeft;

- (IBAction) countdown:(id)sender;


@end
