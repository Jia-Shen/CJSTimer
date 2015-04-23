//
//  NSTimer+CJSSaferTimer.h
//  CJSTimer
//
//  Created by Chuck Shen on 4/23/15.
//  Copyright (c) 2015 Chuck Shen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (CJSSaferTimer)

+ (NSTimer *)cjs_scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                         block:(void(^)())block
                                       repeats:(BOOL)repeats;

@end
