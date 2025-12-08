#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestableCalculator : NSObject

- (NSInteger)add:(NSInteger)a
               b:(NSInteger)b;
- (NSInteger)subtarct:(NSInteger)a
                    b:(NSInteger)b;

@end

NS_ASSUME_NONNULL_END
