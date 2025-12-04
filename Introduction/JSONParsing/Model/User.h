#import "Address.h"
#import "BaseJSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface User : BaseJSONModel

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) Address *address;
@property (nonatomic) NSArray<Address *> <Address> *prevAddresses;

@end

NS_ASSUME_NONNULL_END
