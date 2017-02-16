#import <XCTest/XCTest.h>
#import "Request.h"

@interface RequestTests : XCTestCase

@end

@implementation RequestTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitRequestSetsSearchTerm {
    NSString* testString = @"gobbledygook";
    Request *testRequest = [[Request alloc] initWithSearchTerm:testString];
    XCTAssertEqualObjects(testString, [testRequest searchTerm]);
    
}


@end
