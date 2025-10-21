#import "Post.h"

@implementation Post

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _userId = [dictionary[@"userId"] integerValue];
        _postId = [dictionary[@"id"] integerValue];
        _title = dictionary[@"title"];
        _body = dictionary[@"body"];
    }
    return self;
}

- (void)print {
    NSLog(@"userId = %ld, id = %ld, title = %@, body = %@", _userId, _postId, _title, _body);
}

@end
