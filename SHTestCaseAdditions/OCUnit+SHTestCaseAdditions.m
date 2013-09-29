
#import "OCUnit+SHTestCaseAdditions.h"


#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 70000 || __MAC_OS_X_VERSION_MIN_REQUIRED >= 1090)
@implementation XCTestCase (SHTestCaseAdditions)
#else
@implementation SenTestCase (SHTestCaseAdditions)
#endif

-(void)SH_waitForTimeInterval:(NSTimeInterval)theTimeInterval; {
  NSParameterAssert(theTimeInterval > 0.0);
  [self SH_performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    double delayInSeconds = theTimeInterval;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      *didFinish = YES;
    });
  } withTimeout:theTimeInterval+5];
}

-(void)SH_runLoopUntilTestPassesWithBlock:(SHTestCaseConditional)theBlock withTimeOut:(NSTimeInterval)theTimeout; {
  NSParameterAssert(theBlock);
  NSParameterAssert(theTimeout >= 0);
  NSDate * timeoutDate = [NSDate dateWithTimeIntervalSinceNow:theTimeout];
  
  NSTimeInterval timeoutTime = [timeoutDate timeIntervalSinceReferenceDate];
  NSTimeInterval currentTime = 0.0;
  
  
  for (currentTime = [NSDate timeIntervalSinceReferenceDate];
       (theBlock() == NO && currentTime < timeoutTime);
       currentTime = [NSDate timeIntervalSinceReferenceDate]) {
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
  }
  
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 70000 || __MAC_OS_X_VERSION_MIN_REQUIRED >= 1090)
    XCTAssertTrue(currentTime <= timeoutTime, @"Timed out");
#else
    STAssertTrue(currentTime <= timeoutTime, @"Timed out");
#endif
}

-(void)SH_performAsyncTestsWithinBlock:(SHTestCaseBlock)theBlock withTimeout:(NSTimeInterval)theTimeout; {
  NSParameterAssert(theBlock);
  NSParameterAssert(theTimeout >= 0);

  NSDate * timeoutDate = [NSDate dateWithTimeIntervalSinceNow:theTimeout];
  
  NSTimeInterval timeoutSeconds = [timeoutDate timeIntervalSinceReferenceDate];
  NSTimeInterval currentTime = 0.0;
  
  __block BOOL didFinish = NO;
  theBlock(&didFinish);
  for (currentTime = [NSDate timeIntervalSinceReferenceDate];
       (didFinish == NO && currentTime < timeoutSeconds);
       currentTime = [NSDate timeIntervalSinceReferenceDate]) {
    
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    
  }
  
#if (__IPHONE_OS_VERSION_MIN_REQUIRED >= 70000 || __MAC_OS_X_VERSION_MIN_REQUIRED >= 1090)
    XCTAssertTrue(currentTime <= timeoutSeconds, @"Timed out");
#else
    STAssertTrue(currentTime <= timeoutSeconds, @"Timed out");
#endif
}


@end
