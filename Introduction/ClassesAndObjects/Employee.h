#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Employee : NSObject {
    // 인스턴스 변수 선언은 비권장
    @private
    NSString *_salary;
    
    @protected
    NSString *_name;
    
    @public
    NSString *_employeeID;
}

@end

NS_ASSUME_NONNULL_END
