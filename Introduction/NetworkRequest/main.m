#import <Foundation/Foundation.h>
#import "Post.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /// NSURL 설정
        NSString *urlString = @"https://jsonplaceholder.typicode.com/posts/1";
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
            if (error) {
                NSLog(@"Network error: %@", error.localizedDescription);
                return;
            }
            
            NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)response;
            NSInteger statusCode = httpURLResponse.statusCode;
            if (statusCode < 200 || statusCode >= 300) {
                NSLog(@"Server error: %ld", statusCode);
                return;;
            }
            
            NSError *jsonError = nil;
            id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                            options:0
                                                              error:&jsonError];
            
            if (jsonError) {
                NSLog(@"JSON error: %@", jsonError.localizedDescription);
                return;
            }
            
            NSDictionary *postDictionary = (NSDictionary *)jsonObject;
            Post *post = [[Post alloc] initWithDictionary:postDictionary];
            [post print];
        }];
        
        [dataTask resume];
        
        [[NSRunLoop mainRunLoop] run];
    }
    return EXIT_SUCCESS;
}
