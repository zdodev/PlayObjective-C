#import "BankAccount.h"

@implementation BankAccount

- (instancetype)init {
    self = [super init];
    if (self) {
        _balance = 0;
    }
    return self;
}

- (void)deposit:(NSInteger)amount {
    _balance += amount;
    NSLog(@"입금: %ld, 현재 잔액: %ld", amount, _balance);
    
    [_delegate accountBalanceDidChange:_balance];
    
    if ([_delegate respondsToSelector:@selector(accountDidReceiveDeposit:)]) {
        [_delegate accountDidReceiveDeposit:amount];
    }
}

- (void)withdraw:(NSInteger)amount {
    _balance -= amount;
    NSLog(@"출금: %ld, 현재 잔액: %ld", amount, _balance);
    
    [_delegate accountBalanceDidChange:_balance];
    
    if ([_delegate respondsToSelector:@selector(accountDidWithdrawMoney:)]) {
        [_delegate accountDidWithdrawMoney:amount];
    }
}

@end
