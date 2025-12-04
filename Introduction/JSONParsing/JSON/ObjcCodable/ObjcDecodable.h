#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ObjcDecodable <NSObject>

+ (instancetype)fromDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
