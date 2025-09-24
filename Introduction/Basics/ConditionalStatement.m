#import "ConditionalStatement.h"

@implementation ConditionalStatement

- (void)ifElseStatement {
    NSInteger number = 3;
    
    if (number == 3) {
        NSLog(@"number는 %ld입니다.", number);
    }
    
    if (number == 4) {
        NSLog(@"number는 %ld입니다.", number);
    } else {
        NSLog(@"number는 4가 아닙니다.");
    }
}

- (void)switchStatement {
    NSInteger number = 3;
    
    switch (number) {
        case 1:
            NSLog(@"number는 1입니다.");
            break;
        case 2:
            NSLog(@"number는 2입니다.");
            break;
        case 3:
            NSLog(@"number는 3입니다.");
            break;
        default:
            break;
    }
}

@end
