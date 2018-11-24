//
//  NYTAPIManager.m
//  NYTMostPopularArticles
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#import "NYTAPIManager.h"
#import "NYTArticlesConstants.h"
#import "Article.h"
#import "NYTParser.h"

@implementation NYTAPIManager
static NYTAPIManager *sharedManager = nil;



+(NYTAPIManager *)sharedManager {
    @synchronized([NYTAPIManager class]) {
        if (!sharedManager)
            sharedManager = [[self alloc] init];
        return sharedManager;
    }
    return nil;
}

-(void)getMostPopularArticle:(ServiceBlock)serviceBlock
{
    dispatch_queue_t globalQueue;
    globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
   // dispatch_async(globalQueue, ^{
         
        NSArray *articlesArray=nil;
    
        int period = PERWEEK;
        NSString *composedURLString = [NSString stringWithFormat:@"%@/%@/%d%@%@%@%@%@",kURL_GET_MOST_POPULAR_ARTICLE,kATTR_SECTIONS,period,kQueryExtension,kQueryChar,kAPIKEYKey,kCharAssignment,kAPIKEYValue];
    
        NSURL *sessionURL =[NSURL URLWithString:composedURLString];
    
        NSURLSession *taskSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        NSURLSessionDataTask *dataTask = [taskSession dataTaskWithURL:sessionURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
        {
            if(!error)
            {
                NSDictionary *jsonDictionary  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
                NSMutableArray *responesArray = [NYTParser parseArticelsAPIResponse:jsonDictionary];
            
                serviceBlock((NSArray *)responesArray, error);
            
            }
            else
            {
                serviceBlock(articlesArray , error);
            }
        }];
         
         [dataTask resume];
         
    // });
}
@end
