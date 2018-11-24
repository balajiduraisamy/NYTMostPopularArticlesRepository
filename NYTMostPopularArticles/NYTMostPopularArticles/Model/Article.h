//
//  Article.h
//  NYTMostPopularArticles
//
//  Created by BalajiMAC on 24/11/18.
//  Copyright © 2018 BalajiMAC. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Article : NSObject
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *section;
@property (nonatomic, strong)NSString *byline;
@property (nonatomic, strong)NSString *abstract;
@property (nonatomic, strong)NSString *datePublished;
@property (nonatomic, strong)NSString *imageURLIcon;
@property (nonatomic, strong)NSString *imageURLBanner;
@property (nonatomic, strong)NSString *linkURL;
@end

NS_ASSUME_NONNULL_END
