#import <Foundation/Foundation.h>
#import "BankAccountDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface BankAccount : NSObject

@property (nonatomic, weak) id<BankAccountDelegate> delegate;
@property (nonatomic, readonly) NSInteger balance;

- (void)deposit:(NSInteger)amount;
- (void)withdraw:(NSInteger)amount;

@end

NS_ASSUME_NONNULL_END
