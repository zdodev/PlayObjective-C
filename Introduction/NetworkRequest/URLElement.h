#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol URLElement <NSObject>

@property (nonatomic) NSString *method;
@property (nonatomic) NSDictionary<NSString *, NSString *> *header;
@property (nonatomic) NSString *path;
@property (nonatomic) NSData *body;

@end

NS_ASSUME_NONNULL_END
