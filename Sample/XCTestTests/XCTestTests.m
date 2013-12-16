//
//  XCTestTests.m
//  XCTestTests
//
//  Created by Seivan Heidari on 2013-12-16.
//  Copyright (c) 2013 Seivan. All rights reserved.
//


#import "SHKeyValueObserverBlocks.h"
#import "SHFastEnumerationProtocols.h"


#import <XCTestCase+SHTestCaseAdditions.h>


@interface XCTestTests : XCTestCase
@property(nonatomic,strong) NSArray * sampleArray;
@property(nonatomic,strong) NSSet   * sampleSet;

@end

@implementation XCTestTests

-(void)setUp;{
  [super setUp];
  NSMutableArray * mutableArray = @[].mutableCopy;
  NSMutableSet   * mutableSet   = @[].SH_toSet.mutableCopy;
  
  self.sampleArray = mutableArray.SH_toArray;
  self.sampleSet   = mutableSet.SH_toSet;
}

-(void)tearDown;{
  [super tearDown];
}

-(void)testSH_waitForTimeInterval; {
  __block BOOL assertion = NO;
  
  double delayInSeconds = 5.0;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    assertion = YES;
  });
  
  [self SH_waitForTimeInterval:delayInSeconds];
  XCTAssertTrue(assertion);
}

-(void)testSH_runLoopUntilTestPassesWithBlock_withTimeOut; {
  NSString * keyPath   = @"sampleSet";
  __block BOOL didPass = NO;
  
  [self SH_addObserverForKeyPaths:@[keyPath] withOptions:0 block:^(id weakSelf, NSString *keyPath, NSDictionary *change) {
    didPass = YES;
  }];
  
  double delayInSeconds = 2;
  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
    [[self mutableArrayValueForKey:keyPath] addObject:@"Lol"];
  });
  
  
  [self SH_runLoopUntilTestPassesWithBlock:^BOOL{
    return didPass;
  } withTimeOut:5];
  
  
  XCTAssertTrue(didPass);
  
}

-(void)testSH_performAsyncTestsWithinBlock_withTimeout; {
  NSString * keyPath   = @"sampleArray";
  __block BOOL didPass = NO;
  
  [self SH_performAsyncTestsWithinBlock:^(BOOL *didFinish) {
    
    [self SH_addObserverForKeyPaths:@[keyPath] withOptions:0 block:^(id weakSelf, NSString *keyPath, NSDictionary *change) {
      didPass    = YES;
      *didFinish = YES;
    }];
    
    double delayInSeconds = 2;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
      [[self mutableArrayValueForKey:keyPath] addObject:@"Lol"];
    });
    
  } withTimeout:5];
  
  XCTAssertTrue(didPass);
  
  XCTAssertTrue(didPass);
  
  
}

@end

