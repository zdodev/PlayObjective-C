#import <Foundation/Foundation.h>
#import "User.h"
#import "ObjcJSONEncoder.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        User *user = [User new];
        user.name = @"홍길동";
        user.age = 30;
        
        user.address = [[Address alloc] initWithCity:@"서울"
                                              street:@"강남대로"
                                             zipCode:@"12345"];
        
        user.prevAddresses = @[
            [[Address alloc] initWithCity:@"부산"
                                   street:@"해운대로"
                                  zipCode:@"54321"],
            [[Address alloc] initWithCity:@"강원"
                                   street:@"강릉대로"
                                  zipCode:@"32415"]
        ];
        
        NSError *error = nil;
        NSData *data = [ObjcJSONEncoder encode:user
                                         error:&error];
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }
    return EXIT_SUCCESS;
}
