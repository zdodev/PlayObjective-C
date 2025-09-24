#import <Foundation/Foundation.h>
#import "ConditionalStatement.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ConditionalStatement * conditionalStatement = [ConditionalStatement new];
//        [conditionalStatement ifElseStatement];
        [conditionalStatement switchStatement];
    }
    return EXIT_SUCCESS;
}
