#import "Address.h"

@implementation Address

- (instancetype)initWithCity:(NSString *)city
                      street:(NSString *)street
                     zipCode:(NSString *)zipCode {
    self = [super init];
    if (self) {
        _city = city;
        _street = street;
        _zipCode = zipCode;
    }
    return self;
}

@end
