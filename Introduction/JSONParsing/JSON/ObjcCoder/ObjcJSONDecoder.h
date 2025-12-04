#import "ObjcDecodable.h"

NS_ASSUME_NONNULL_BEGIN

@interface ObjcJSONDecoder : NSObject

+ (id)decode:(NSData *)data
     toClass:(Class<ObjcDecodable>)cls
       error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
