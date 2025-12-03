#import "WebRepository.h"

@implementation WebRepository

- (instancetype)initWithBaseURL:(NSString *)baseURL {
    self = [super init];
    if (self) {
        _baseURL = baseURL;
    }
    return self;
}

- (void)request:(id<URLElement>)urlElement
     completion:(nonnull Completion)completion {
    NSURL *url = [NSURL URLWithString:_baseURL
            encodingInvalidCharacters:YES];
    NSURL *fullURL = [url URLByAppendingPathComponent:urlElement.path];
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:fullURL];
    urlRequest.HTTPMethod = urlElement.method;
    urlRequest.HTTPBody = urlElement.body;
    
    [[NSURLSession.sharedSession dataTaskWithRequest:urlRequest
                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        
        completion(data, nil);
    }] resume];
}

@end
