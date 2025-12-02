#import <Foundation/Foundation.h>
#import "URLElement.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^Completion)(NSData * _Nullable data, NSError * _Nullable error);

@interface WebRepository : NSObject

@property (nonatomic, readonly) NSString *baseURL;

- (void)request:(id<URLElement>)urlElement
     completion:(Completion)completion;

@end

NS_ASSUME_NONNULL_END
