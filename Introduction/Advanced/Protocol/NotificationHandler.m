#import "NotificationHandler.h"

@implementation NotificationHandler

- (void)accountBalanceDidChange:(NSInteger)newBalance {
    NSLog(@"[알림] 잔액이 %ld로 변경되었습니다.", newBalance);
}

- (void)accountDidReceiveDeposit:(NSInteger)amount {
    NSLog(@"[알림] %ld 원이 입금되었습니다.", amount);
}

- (void)accountDidWithdrawMoney:(NSInteger)amount {
    NSLog(@"[알림] %ld 원이 출금되었습니다.", amount);
}

@end
