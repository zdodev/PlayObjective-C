#import <XCTest/XCTest.h>
#import "TestableCalculator.h"

@interface Tests : XCTestCase

@property (nonatomic) TestableCalculator *calculator;

@end

@implementation Tests

- (void)setUp {
    [super setUp];
    
    self.calculator = [TestableCalculator new];
}

- (void)tearDown {
    self.calculator = nil;
    
    [super tearDown];
}

- (void)test_add_두_정수를_더하면_합계를_반환한다 {
    // given
    NSInteger firstNumber = 10;
    NSInteger secondNubmer = 20;
    
    // when
    NSInteger result = [_calculator add:firstNumber
                                      b:secondNubmer];
    
    // then
    XCTAssertEqual(result, 30, @"10 + 20은 30이어야 합니다.");
}

- (void)test_subtract_두_정수를_빼면_차를_반환한다 {
    // given
    NSInteger firstNumber = 10;
    NSInteger secondNumber = 5;
    
    // when
    NSInteger result = [_calculator subtarct:firstNumber
                                           b:secondNumber];
    
    // then
    XCTAssertEqual(result, 5, "10 - 5는 5이어야 합니다.");
}

@end
