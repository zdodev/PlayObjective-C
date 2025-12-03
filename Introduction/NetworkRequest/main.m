#import <Foundation/Foundation.h>
#import "PostURLElement.h"
#import "WebRepository.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        PostURLElement *urlElement = [PostURLElement new];
        urlElement.method = @"GET";
        urlElement.path = @"/posts/1";
        urlElement.body = [NSData new];
        
        WebRepository *repository = [[WebRepository alloc] initWithBaseURL:@"https://jsonplaceholder.typicode.com"];
        [repository request:urlElement completion:^(NSData * _Nullable data, NSError * _Nullable error) {
            NSLog(@"%@", error);
        }];
        
        [[NSRunLoop mainRunLoop] run];
    }
    return EXIT_SUCCESS;
}
