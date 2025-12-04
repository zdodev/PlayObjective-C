#import "ObjcEncodable.h"

NS_ASSUME_NONNULL_BEGIN

@interface Address : NSObject <ObjcEncodable>

@property (nonatomic) NSString *city;
@property (nonatomic) NSString *street;
@property (nonatomic) NSString *zipCode;

- (instancetype)initWithCity:(NSString *)city
                      street:(NSString *)street
                     zipCode:(NSString *)zipCode;

@end

NS_ASSUME_NONNULL_END
