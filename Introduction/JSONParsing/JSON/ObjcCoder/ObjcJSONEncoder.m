#import "ObjcJSONEncoder.h"

@implementation ObjcJSONEncoder

+ (NSData *)encode:(id<ObjcEncodable>)object
             error:(NSError *__autoreleasing  _Nullable *)error {
    if (![object conformsToProtocol:@protocol(ObjcEncodable)]) {
        return nil;
    }
    
    NSDictionary *dictionary = [object toDictionary];
    
    if ([NSJSONSerialization isValidJSONObject:dictionary]) {
        return [NSJSONSerialization dataWithJSONObject:dictionary
                                               options:NSJSONWritingPrettyPrinted
                                                 error:error];
    }
    
    return nil;
}

@end
