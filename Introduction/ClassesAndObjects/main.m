#import <Foundation/Foundation.h>
#import "Car.h"
#import "Person.h"
#import "Calculator.h"
#import "Employee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Car *car = [[Car alloc] init];
        [car accelerate];
        
        Person *person = [Person new];
        [person sayHello];
        [Person classMethodExample];
        
        Calculator *calculator = [Calculator new];
        NSInteger result = [calculator add:3
                                        to:7];
        NSLog(@"덧셈 결과: %ld", result);
        
        Vehicle *vehicle = [Car new];
        [vehicle drive];
    }
    return EXIT_SUCCESS;
}
