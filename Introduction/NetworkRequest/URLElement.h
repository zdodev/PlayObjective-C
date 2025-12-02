#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol URLElement <NSObject>

@property (nonatomic, readonly) NSString *method;
@property (nonatomic, readonly) NSDictionary<NSString *, NSString *> *header;
@property (nonatomic, readonly) NSString *path;
@property (nonatomic, readonly) NSData *body;

@end

NS_ASSUME_NONNULL_END
