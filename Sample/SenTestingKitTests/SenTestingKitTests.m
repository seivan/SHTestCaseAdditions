//
//  SenTestingKitTests.m
//  SenTestingKitTests
//
//  Created by Seivan Heidari on 2013-12-16.
//  Copyright (c) 2013 Seivan. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@interface SenTestingKitTests : SenTestCase

@end

@implementation SenTestingKitTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    STFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
