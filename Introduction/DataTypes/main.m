#import <Foundation/Foundation.h>
#import "DataTypeClass.h"
#import "Direction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DataTypeClass *dataTypeClass = [DataTypeClass new];
        [dataTypeClass printTypes];
        
        Direction direction = South;
        switch (direction) {
            case North:
                NSLog(@"북쪽입니다.");
                break;
            case East:
                NSLog(@"동쪽입니다.");
                break;
            case West:
                NSLog(@"서쪽입니다.");
                break;
            case South:
                NSLog(@"남쪽입니다.");
                break;
            default:
                break;
        }
    }
    return EXIT_SUCCESS;
}
