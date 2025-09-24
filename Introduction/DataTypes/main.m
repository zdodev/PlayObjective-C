#import <Foundation/Foundation.h>
#import "DataTypeClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DataTypeClass *dataTypeClass = [DataTypeClass new];
        [dataTypeClass printTypes];
    }
    return EXIT_SUCCESS;
}
