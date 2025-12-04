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
        
        NSArray *list = @[
            [[Address alloc] initWithCity:@"부산"
                                   street:@"해운대로"
                                  zipCode:@"54321"],
            [[Address alloc] initWithCity:@"강원"
                                   street:@"강릉대로"
                                  zipCode:@"32415"]
        ];
        
//        user.prevAddresses = (NSArray<Address> *)list;
        user.prevAddresses = (id)list;

//        user.prevAddresses = @[
//            [[Address alloc] initWithCity:@"부산"
//                                   street:@"해운대로"
//                                  zipCode:@"54321"],
//            [[Address alloc] initWithCity:@"강원"
//                                   street:@"강릉대로"
//                                  zipCode:@"32415"]
//        ];
        
        NSDictionary *d = [user toDictionary];
        User *k = [User fromDictionary:d];
        Address *item = k.prevAddresses[0];
        
        
    }
    return EXIT_SUCCESS;
}
