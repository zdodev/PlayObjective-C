#import "DataTypeClass.h"

@implementation DataTypeClass

- (instancetype)init {
    self = [super init];
    if (self) {
        _booleanType = true;
        
        _integerType = 3;
        _uIntegerType = 2;
        _floatType = 3.14;
        
        _numberType = @4;
        
        _stringType = @"Objective-C";
        _mutableStringType = [[NSMutableString alloc] initWithString:@"Mutable Objective-C"];
        
        _arrayType = @[@"apple", @"banana", @"cherry"];
        _mutableArrayType = [NSMutableArray arrayWithObjects:@"apple", @"banana", @"cherry", nil];
        
        _setType = [NSSet setWithObjects:@"apple", @"banana", @"cherry", nil];
        _mutableSetType = [NSMutableSet setWithObjects:@"apple", @"banana", @"cherry", nil];
        
        _dictionaryType = @{
            @"name": @"zdo",
            @"age": @25,
            @"city": @"Seoul"
        };
        _mutableDictionaryType = [NSMutableDictionary dictionaryWithDictionary:@{
            @"name": @"zdo",
            @"age": @25,
            @"city": @"Seoul"
        }];
    }
    return self;
}

- (void)printTypes {
    NSLog(@"BOOL type: %d", _booleanType);
    
    NSLog(@"NSInteger type: %ld", _integerType);
    NSLog(@"NSUInteger type: %ld", _uIntegerType);
    NSLog(@"CGFloat type: %f", _floatType);
    NSLog(@"NSNumber type: %@", _numberType);
    _numberType = @6.28;
    NSLog(@"NSNumber type: %@", _numberType);
    
    NSLog(@"NSString type: %@", _stringType);
    NSLog(@"NSMutableString type: %@", _mutableStringType);
    
    NSLog(@"NSArray type: %@", _arrayType);
    NSLog(@"NSMutableArray type: %@", _mutableArrayType);
    
    NSLog(@"NSSet type: %@", _setType);
    NSLog(@"NSMutableSet type: %@", _mutableSetType);
    
    NSLog(@"NSDictionary type: %@", _dictionaryType);
    NSLog(@"NSMutableDictionary type: %@", _mutableDictionaryType);
}

@end
