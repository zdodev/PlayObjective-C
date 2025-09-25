#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BankAccountDelegate <NSObject>

@required
- (void)accountBalanceDidChange:(NSInteger)newBalance;

@optional
- (void)accountDidReceiveDeposit:(NSInteger)amount;
- (void)accountDidWithdrawMoney:(NSInteger)amount;

@end

NS_ASSUME_NONNULL_END
