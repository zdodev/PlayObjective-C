#import "ObjcEncodable.h"
#import "BaseJSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Address

@end

@interface Address : BaseJSONModel

@property (nonatomic) NSString *city;
@property (nonatomic) NSString *street;
@property (nonatomic) NSString *zipCode;

- (instancetype)initWithCity:(NSString *)city
                      street:(NSString *)street
                     zipCode:(NSString *)zipCode;

@end

NS_ASSUME_NONNULL_END
