//
//  NYTParser.m
//  NYTMostPopularArticles
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#import "NYTParser.h"
#import "Article.h"

@implementation NYTParser



+(NSMutableArray *)parseArticelsAPIResponse:(NSDictionary *)dataDictionary
{
    NSMutableArray *resultsArray = nil;
    Article *article;
    if([dataDictionary objectForKey:@"results"])
    {
        NSArray *articlesArray = [dataDictionary objectForKey:@"results"];
        resultsArray = [[NSMutableArray alloc] init];
        
        for(NSDictionary *articlesDict in articlesArray)
        {
            article = [[Article alloc] init];
            
            if([articlesDict objectForKey:@"title"])
            {
                article.title = [articlesDict objectForKey:@"title"];
            }
            
            if([articlesDict objectForKey:@"url"])
            {
                article.linkURL = [articlesDict objectForKey:@"url"];
            }
            if([articlesDict objectForKey:@"byline"])
            {
                article.byline = [articlesDict objectForKey:@"byline"];
            }
            if([articlesDict objectForKey:@"abstract"])
            {
                article.abstract = [articlesDict objectForKey:@"abstract"];
            }
            if([articlesDict objectForKey:@"published_date"])
            {
                article.datePublished = [articlesDict objectForKey:@"published_date"];
            }
            if([articlesDict objectForKey:@"section"])
            {
                article.section = [articlesDict objectForKey:@"section"];
            }
            if([articlesDict objectForKey:@"media"])
            {
                NSDictionary *mediaDictionary = [[articlesDict objectForKey:@"media"] firstObject];
                
                if([mediaDictionary objectForKey:@"media-metadata"])
                {
                    NSArray *imageArray = [mediaDictionary objectForKey:@"media-metadata"];
                    for(NSDictionary *imageDictionary in imageArray)
                    {
                        if([imageDictionary objectForKey:@"format"])
                        {
                            if([[imageDictionary objectForKey:@"format"] isEqualToString:@"Standard Thumbnail"])
                            article.imageURLIcon = [imageDictionary objectForKey:@"url"];
                            else if([[imageDictionary objectForKey:@"format"] isEqualToString:@"Large"])
                            article.imageURLBanner = [imageDictionary objectForKey:@"url"];
                            else
                            continue;
                        }
                    }
                }
                
            }
            
            [resultsArray addObject:article];
        }
        
        
    }
    
    return resultsArray;
}
@end
