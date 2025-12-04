#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ObjcEncodable <NSObject>

- (NSDictionary *)toDictionary;

@end

NS_ASSUME_NONNULL_END
