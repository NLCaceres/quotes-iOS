//
//  InClassLabTests.m
//  InClassLabTests
//
//  Created by Nicholas Caceres on 9/28/15.
//  Copyright (c) 2015 Nicholas Caceres. All rights reserved.
//
// Want to add more test cases just go file -> new -> file and get a new test case in source
// You can name ViewControllerTests and check how your code will work out.

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "QuoteModel.h"

@interface InClassLabTests : XCTestCase

@property (strong, nonatomic) QuoteModel *testModel;

@end

@implementation InClassLabTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testModel = [[QuoteModel alloc] init];
}

- (void) LogHelper {
    NSDictionary *quote;
    for (NSUInteger i=0; i < [self.testModel numberOfQuotes]; i++) {
        quote = [self.testModel quoteAtIndex:i];
        NSLog(@"quote = %@, author = %@", quote[kQuote], quote[kAuthor]);
        NSLog(@" ");
    }
}

- (void) test {
    // product then run to check that this works or not
    // testing that array was created with the correct number of students
    NSUInteger num = 5; //init method for DataModel creates 3 students
    NSUInteger numQuotes = [self.testModel numberOfQuotes];
    XCTAssertEqual(num, numQuotes);
    NSLog (@"Initial array set up");
    [self LogHelper];
    
    // testing that it is possible to insert a new student
    NSDictionary *quote9 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Martirosyan", kQuote, @"Anthony", kAuthor, nil];
    [self.testModel insertQuote:quote9];
    XCTAssertEqual(num + 1, [self.testModel numberOfQuotes]);
    NSLog (@"Anthony Martirosyan added into the array from Dictionary");
    [self LogHelper];
    
    [self.testModel insertQuote:@"Con" author:@"Leonel"];
    XCTAssertEqual(num + 2, [self.testModel numberOfQuotes]);
    NSLog(@"Leonel Con added by object and key");
    [self LogHelper];

    [self.testModel insertQuote:@"Hong" author:@"Henry"  atIndex:3];
    XCTAssertEqual(num + 3, [self.testModel numberOfQuotes]);
    NSLog(@"Henry Hong added by object and key at index 3");
    [self LogHelper];
    
    // testing that I can remove a student
    [self.testModel removeQuoteAtIndex:0];
    XCTAssertEqual(num + 2, [self.testModel numberOfQuotes]);
    NSLog(@"First dictionary in array has been removed");
    [self LogHelper];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
