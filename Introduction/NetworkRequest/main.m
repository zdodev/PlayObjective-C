#import <Foundation/Foundation.h>
#import "Post.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /// NSURL 설정
        NSString *urlString = @"https://jsonplaceholder.typicode.com/posts/";
        NSURL *url = [NSURL URLWithString:urlString
                encodingInvalidCharacters:true];

        /// NSURLRequest 설정
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
        
        // cache policy 설정
        urlRequest.cachePolicy = NSURLRequestUseProtocolCachePolicy;
        /*
         * NSURLRequestReloadIgnoringLocalCacheData
         * NSURLRequestReloadIgnoringLocalAndRemoteCacheData
         * NSURLRequestReloadIgnoringCacheData
         * NSURLRequestReturnCacheDataElseLoad
         * NSURLRequestReloadRevalidatingCacheData
         */
        
        // components 설정
        urlRequest.HTTPMethod = @"GET";
        urlRequest.HTTPBody = nil;
        
        // header 설정
        urlRequest.allHTTPHeaderFields = nil;
        
        // behavior 설정
        urlRequest.timeoutInterval = 60;
        
        /// NSURLSession 설정
        NSURLSessionConfiguration *configuration = NSURLSessionConfiguration.defaultSessionConfiguration;
        configuration.timeoutIntervalForRequest = 20;
        configuration.timeoutIntervalForResource = 20;
        configuration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
        configuration.HTTPAdditionalHeaders = @{
            @"key": @"value"
        };
        
        NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
        
        /// HTTP 요청
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSError *jsonError = nil;
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                            options:0
                                                              error:&jsonError];
            
            NSArray *postsArray = (NSArray *)jsonObject;
            NSMutableArray<Post *> *posts = [NSMutableArray new];
            
            for (NSDictionary *postDict in postsArray) {
                Post *post = [[Post alloc] initWithDictionary:postDict];
                [posts addObject:post];
                [post print];
            }
        }];
        
        [dataTask resume];
        
        [[NSRunLoop mainRunLoop] run];
    }
    return EXIT_SUCCESS;
}
