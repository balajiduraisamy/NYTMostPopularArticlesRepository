//
//  NYTMostPopularArticlesTests.m
//  NYTMostPopularArticlesTests
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NYTMostPopularArticlesTests : XCTestCase

@property XCTestExpectation *expectation;
@end

@implementation NYTMostPopularArticlesTests



-(void)testServiceCall
{
    _expectation = [self expectationWithDescription:@"waiting for Service call to complete"];
    dispatch_queue_t globalQueue;
    globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
    NSString *composedURLString = @"https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=ef848ca1c21741969bb0459ca8542b65";
    NSURL *sessionURL =[NSURL URLWithString:composedURLString];
    NSURLSession *taskSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *dataTask = [taskSession dataTaskWithURL:sessionURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        XCTAssert(error,@"Test Case Failed");
        [self->_expectation fulfill];
        
    }];
    [dataTask resume];
    });
    [self waitForExpectationsWithTimeout:30.0 handler:nil];
}

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
