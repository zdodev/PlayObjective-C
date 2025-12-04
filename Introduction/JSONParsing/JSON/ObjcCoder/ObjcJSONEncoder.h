#import "ObjcEncodable.h"

NS_ASSUME_NONNULL_BEGIN

@interface ObjcJSONEncoder : NSObject

+ (NSData *)encode:(id<ObjcEncodable>)object
             error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
