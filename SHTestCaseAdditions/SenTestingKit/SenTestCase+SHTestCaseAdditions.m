#import "SenTestCase+SHTestCaseAdditions.h"

#import "__SHTestCaseInternal.h"

@implementation SenTestCase (SHTestCaseAdditions)

-(void)SH_waitForTimeInterval:(NSTimeInterval)theTimeInterval; {
  STAssertTrue([__SHTestCaseInternal waitForTimeInterval:theTimeInterval], [__SHTestCaseInternal timeOutMessage]) ;
}

-(void)SH_runLoopUntilTestPassesWithBlock:(SHTestCaseConditional)theBlock withTimeOut:(NSTimeInterval)theTimeout; {
  STAssertTrue([__SHTestCaseInternal runLoopUntilTestPassesWithBlock:theBlock withTimeOut:theTimeout],[__SHTestCaseInternal timeOutMessage]) ;
}

-(void)SH_performAsyncTestsWithinBlock:(SHTestCaseBlock)theBlock withTimeout:(NSTimeInterval)theTimeout; {
  STAssertTrue([__SHTestCaseInternal performAsyncTestsWithinBlock:theBlock withTimeout:theTimeout],[__SHTestCaseInternal timeOutMessage]) ;

}


@end
