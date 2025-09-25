#import <Foundation/Foundation.h>
#import "NSString+Reverse.h"
#import "BankAccount.h"
#import "NotificationHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *s = @"abcdef";
        NSLog(@"%@", [s reversed]);
        
        BankAccount *bankAccount = [BankAccount new];
        NotificationHandler *handler = [NotificationHandler new];
        
        bankAccount.delegate = handler;
        
        [bankAccount deposit:100];
        [bankAccount withdraw:30];
    }
    return EXIT_SUCCESS;
}
