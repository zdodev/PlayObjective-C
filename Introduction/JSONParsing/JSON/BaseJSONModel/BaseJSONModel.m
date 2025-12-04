#import "BaseJSONModel.h"
#import <objc/runtime.h>

@implementation BaseJSONModel

+ (instancetype)fromDictionary:(NSDictionary *)dictionary {
    id model = [self new];
    
    [model setValuesForKeysWithDictionary:dictionary];
    
    return model;
}

- (NSDictionary *)toDictionary {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (NSInteger i = 0; i < count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        
        id value = [self valueForKey:key];
        
        if (value) {
            if ([value isKindOfClass:[BaseJSONModel class]]) {
                dictionary[key] = [value toDictionary];
            } else if ([value isKindOfClass:[NSArray class]]) {
                NSMutableArray *array = [NSMutableArray array];
                for (id item in value) {
                    if ([item isKindOfClass:[BaseJSONModel class]]) {
                        [array addObject:[item toDictionary]];
                    } else {
                        [array addObject:item];
                    }
                }
                dictionary[key] = array;
            } else {
                dictionary[key] = value;
            }
        }
    }
    free(properties);
    return dictionary;
}

// 1. [흑마법] 프로퍼티의 속성(Attribute) 문자열을 분석하여 클래스 타입 추론
- (Class)classForPropertyName:(NSString *)propertyName {
    objc_property_t property = class_getProperty([self class], [propertyName UTF8String]);
    if (!property) return nil;
    
    // 속성 문자열 가져오기 (예: T@"NSArray<Product>",&,N,V_products)
    const char *attrs = property_getAttributes(property);
    NSString *propertyAttributes = [NSString stringWithUTF8String:attrs];
    NSLog(@"%@", propertyAttributes);
    
    // 1-1. 프로토콜(<Type>)이 포함된 경우 (주로 배열)
    // "NSArray<Product>" 형태에서 "Product" 추출
    if ([propertyAttributes containsString:@"<"] && [propertyAttributes containsString:@">"]) {
        NSRange start = [propertyAttributes rangeOfString:@"<"];
        NSRange end = [propertyAttributes rangeOfString:@">"];
        if (start.location != NSNotFound && end.location != NSNotFound) {
            NSRange range = NSMakeRange(start.location + 1, end.location - start.location - 1);
            NSString *protocolName = [propertyAttributes substringWithRange:range];
            return NSClassFromString(protocolName);
        }
    }
    
    // 1-2. 일반 클래스 객체인 경우 (T@"Address")
    NSArray *splitAttributes = [propertyAttributes componentsSeparatedByString:@","];
    if (splitAttributes.count > 0) {
        NSString *typeAttribute = splitAttributes[0];
        if ([typeAttribute hasPrefix:@"T@\""] && [typeAttribute length] > 1) {
            // T@" 와 " 제거
            NSString *className = [typeAttribute substringWithRange:NSMakeRange(3, [typeAttribute length] - 4)];
            return NSClassFromString(className);
        }
    }
    return nil;
}

// 2. [Decoding] Setter를 가로채서 중첩 객체 및 배열 자동 변환
- (void)setValue:(id)value forKey:(NSString *)key {
    // 값이 nil이면 무시
    if (value == nil || [value isKindOfClass:[NSNull class]]) {
        return;
    }

    // A. 배열(List)인 경우
    if ([value isKindOfClass:[NSArray class]]) {
        // 프로퍼티 정보를 통해 배열 안의 아이템 클래스 확인
        Class itemClass = [self classForPropertyName:key];
        
        // 아이템 클래스가 BaseMagicModel의 자식이라면 변환 시작
        if (itemClass && [itemClass isSubclassOfClass:[BaseJSONModel class]]) {
            NSMutableArray *models = [NSMutableArray array];
            for (id item in value) {
                if ([item isKindOfClass:[NSDictionary class]]) {
                    [models addObject:[itemClass fromDictionary:item]];
                }
            }
            [super setValue:models forKey:key];
            return;
        }
    }
    // B. 딕셔너리(Object)인 경우
    else if ([value isKindOfClass:[NSDictionary class]]) {
        Class propertyClass = [self classForPropertyName:key];
        
        if (propertyClass && [propertyClass isSubclassOfClass:[BaseJSONModel class]]) {
            id nestedObject = [propertyClass fromDictionary:value];
            [super setValue:nestedObject forKey:key];
            return;
        }
    }
    
    // C. 일반 값 (String, Number 등)
    [super setValue:value forKey:key];
}

// 안전장치: JSON에 없는 키가 모델에 들어올 때 크래시 방지
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    // 필요 시 NSLog로 경고 출력
}

@end
