//
//  giphysearchTests.m
//  giphysearchTests
//
//  Created by Anita Daswani on 2/12/17.
//  Copyright © 2017 SMD. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface giphysearchTests : XCTestCase

@end

@implementation giphysearchTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGiphyAPIKeyIsCorrect {
    XCTAssertTrue([@"dc6zaTOxFJmzC" isEqualToString:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"GiphyAPIKey"]]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
