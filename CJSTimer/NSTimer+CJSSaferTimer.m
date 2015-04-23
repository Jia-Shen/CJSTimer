//
//  NSTimer+CJSSaferTimer.m
//  CJSTimer
//
//  Created by Chuck Shen on 4/23/15.
//  Copyright (c) 2015 Chuck Shen. All rights reserved.
//

#import "NSTimer+CJSSaferTimer.h"

@implementation NSTimer (CJSSaferTimer)

+ (NSTimer*)cjs_scheduledTimerWithTimeInterval: (NSTimeInterval)interval
                                        block:(void(^)())block repeats:(BOOL)repeats
{
    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(cjs_blockInvoke:)
                                       userInfo:[block copy]
                                        repeats:repeats];
}


+ (void)cjs_blockInvoke:(NSTimer*)timer {
    void (^block)() = timer.userInfo;
    if (block) {
        block();
    }
}


@end
