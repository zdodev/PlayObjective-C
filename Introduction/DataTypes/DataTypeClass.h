#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataTypeClass : NSObject

@property BOOL booleanType;

@property (atomic, readwrite, assign) NSInteger integerType;
@property NSUInteger uIntegerType;
@property CGFloat floatType;
@property (atomic, readwrite, strong) NSNumber *numberType;

@property NSString *stringType;
@property NSMutableString *mutableStringType;

@property NSArray *arrayType;
@property NSMutableArray *mutableArrayType;

@property NSSet *setType;
@property NSMutableSet *mutableSetType;

@property NSDictionary *dictionaryType;
@property NSMutableDictionary *mutableDictionaryType;

- (void)printTypes;

@end

NS_ASSUME_NONNULL_END
