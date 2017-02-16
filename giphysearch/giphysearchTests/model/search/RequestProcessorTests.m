#import <XCTest/XCTest.h>
#import <Giphy-iOS/AXCGiphy.h>
#import "ServiceLocator.h"
#import "Request.h"

@interface RequestProcessorTests : XCTestCase
@property RequestProcessor* toTest;
@end

@interface ResultProcessorStub : NSObject <ResultProcessor>

@property (readonly) XCTestExpectation* expectation;
-(id) initWithExpectation:(XCTestExpectation*)expectation;

@end

@implementation ResultProcessorStub

-(id) initWithExpectation:(XCTestExpectation*)expectation {
    self = [super init];
    if (self) {
        _expectation = expectation;
    }
    return self;
}

-(void) processResults:(NSArray*)results {
    [_expectation fulfill];
}

@end

@implementation RequestProcessorTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testProcessRequestFiresOffSearch {
    XCTestExpectation *expectation = [self expectationWithDescription:@"Test Result Processor is called."];
    [[ServiceLocator sharedLocator] setResultProcessor:[[ResultProcessorStub alloc] initWithExpectation:expectation]];
    RequestProcessor* processor = [[RequestProcessor alloc] init];
    [processor processRequest:[[Request alloc] initWithSearchTerm:@"Susheel"]];
    [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        }
    }];
}

@end
