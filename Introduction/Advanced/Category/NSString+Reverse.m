#import "NSString+Reverse.h"

@implementation NSString (Reverse)

- (NSString *)reversed {
    NSMutableString *reversed = [NSMutableString string];
    for (NSInteger i = self.length - 1; i >= 0; i--) {
        [reversed appendFormat:@"%c", [self characterAtIndex:i]];
    }
    return reversed;
}

@end
