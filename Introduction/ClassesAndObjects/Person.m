#import "Person.h"

@implementation Person

- (void)sayHello {
    NSLog(@"안녕하세요!");
}

+ (void)classMethodExample {
    NSLog(@"이것은 클래스 메서드입니다. 객체 생성 없이 호출 가능합니다.");
}

@end
