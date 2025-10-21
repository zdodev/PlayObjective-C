#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property (nonatomic, readonly) NSInteger userId;
@property (nonatomic, readonly) NSInteger postId;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *body;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)print;

@end

NS_ASSUME_NONNULL_END
