#import "Address.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject <ObjcEncodable>

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) Address *address;
@property (nonatomic) NSArray<Address *> *prevAddresses;

@end

NS_ASSUME_NONNULL_END
