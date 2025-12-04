#import "ObjcJSONDecoder.h"

@implementation ObjcJSONDecoder

+ (id)decode:(NSData *)data
     toClass:(Class<ObjcDecodable>)cls
       error:(NSError *__autoreleasing  _Nullable *)error {
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                    options:0
                                                      error:error];
    
    if (*error) {
        return nil;
    }
    
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
        if ([cls conformsToProtocol:@protocol(ObjcDecodable)]) {
            return [cls fromDictionary: jsonObject];
        }
    }
    
    return nil;
}

@end
