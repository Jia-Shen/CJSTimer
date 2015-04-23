//
//  ViewController.m
//  CJSTimer
//
//  Created by Chuck Shen on 4/23/15.
//  Copyright (c) 2015 Chuck Shen. All rights reserved.
//

#import "ViewController.h"
#import "NSTimer+CJSSaferTimer.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *autoRefreshTimer;
@property (nonatomic, assign) NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ViewController __weak *weakSelf = self;
    NSTimeInterval timeInterval = 1;
    self.count = 0;
    self.autoRefreshTimer = [NSTimer cjs_scheduledTimerWithTimeInterval:timeInterval
                                                             block:^{
                                                                 ViewController __strong *strongSelf = weakSelf;
                                                                 strongSelf.label.text = [NSString stringWithFormat:@"%@", @(strongSelf.count)];
                                                                 strongSelf.count ++;
                                                                 
                                                             }
                                                           repeats:YES];
}


- (void)dealloc
{
    //if timer is forgot invalidate, nothing bad will be happened.
    [_autoRefreshTimer invalidate];
}


@end
