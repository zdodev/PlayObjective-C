#import "User.h"

@implementation User

- (NSDictionary *)toDictionary {
    // 기본 타입 변환
    NSMutableDictionary *dictionary = [[self dictionaryWithValuesForKeys:@[@"name", @"age"]] mutableCopy];
    
    // 중첩 타입 변환
    if (_address) {
        dictionary[@"address"] = [_address toDictionary];
    }
    
    // 배열 타입 변환
    if (_prevAddresses) {
        NSMutableArray *array = [NSMutableArray array];
        for (Address *address in _prevAddresses) {
            [array addObject:[address toDictionary]];
        }
        dictionary[@"prevAddresses"] = array;
    }
    
    return dictionary;
}

@end
